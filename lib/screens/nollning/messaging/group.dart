import 'package:action_cable/action_cable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/messages/message.dart';
import 'package:fsek_mobile/models/messages/messaging_group.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/services/messages.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:html/parser.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// This file is chaos, but it workss... it should probably be made into smaller files
class GroupPage extends StatefulWidget {
  const GroupPage({Key? key, required this.group}) : super(key: key);

  final MessagingGroup group;

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> with WidgetsBindingObserver {
  List<Message> messages = [];
  User? thisUser;
  ActionCable? cable;
  final PagingController<int, Message> _pagingController = PagingController(firstPageKey: 1);

  String _channelName = "GroupsChannel";
  Map _channelParams = {};
  TextEditingController _controller = TextEditingController();
  TextEditingController _updateMessageController = TextEditingController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      loadMoreMessages(widget.group.id!, pageKey);
    });

    locator<UserService>().getUser().then((value) => thisUser = value);
    connectToActionCable();
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    // Set the controller in build-method as we have access to BuildContext here
    setState(() {
      _controller = TextEditingController(text: widget.group.group_type == "info" ? t.groupWriteProtected : "");
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.group.name!),
        ),
        body: Stack(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight - 60,
                child: PagedListView<int, Message>(
                  pagingController: _pagingController,
                  reverse: true,
                  shrinkWrap: true,
                  builderDelegate: PagedChildBuilderDelegate<Message>(itemBuilder: (context, message, index) {
                    if (message.name == null || message.text == null) return Container();
                    Widget _date = Container(); //Container is basically null :D
                    if (messages.length > 0 && messages.length > index + 1 && messages[index + 1].day != message.day) {
                      _date = Padding(child: Text(message.day!), padding: EdgeInsets.fromLTRB(0, 16, 0, 5));
                    }

                    return Column(
                      children: [
                        _date,
                        Row(mainAxisAlignment: isThisUser(message.name!) ? MainAxisAlignment.end : MainAxisAlignment.start, children: [
                          message.avatar != null && message.avatar!.isNotEmpty && !isThisUser(message.name!)
                              ? Image.network(
                                  message.avatar!,
                                  width: 50,
                                )
                              : Container(),
                          Container(
                              width: MediaQuery.of(context).size.width * 2 / 3,
                              child: GestureDetector(
                                onLongPress: isThisUser(message.name!)
                                    ? () => showDialog(
                                          context: context,
                                          builder: (context) => holdPopup(context, message),
                                        )
                                    : null,
                                child: Card(
                                    child: InkWell(
                                        onTap: () => null,
                                        child: ListTile(
                                          tileColor: isThisUser(message.name!) ? Colors.green[100] : Colors.blue[100],
                                          contentPadding: EdgeInsets.fromLTRB(10, 1, 10, 1),
                                          title: Text(message.name!),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                                  child: Html(
                                                      data: message.text,
                                                      style: {"body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero), "p": Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero)},
                                                      onLinkTap: (String? url, RenderContext context, Map<String, String> attributes, element) {
                                                        launch(url!);
                                                      })),
                                              Row(
                                                children: [Text(message.time!)],
                                                mainAxisAlignment: MainAxisAlignment.end,
                                              )
                                            ],
                                          ),
                                        ))),
                              )),
                        ]),
                      ],
                    );
                  }),
                ),
              );
            }),
            Column(
              children: [_getTextField()],
              mainAxisAlignment: MainAxisAlignment.end,
            )
          ],
        ));
  }

  @override
  void dispose() {
    cable!.unsubscribe(_channelName, channelParams: _channelParams);
    cable!.disconnect();
    _pagingController.dispose();
    _controller.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  String getTextWithoutHtml(String text) {
    return parse(text).documentElement?.text ?? "[APP ERROR]";
  }

  Widget _getTextField() {
    return Container(
        color: Colors.grey[200],
        child: Stack(children: [
          LayoutBuilder(builder: (context, constraint) {
            return Container(
              width: constraint.maxWidth - 60,
              child: TextFormField(
                  enabled: widget.group.group_type != "info",
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  )),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: TextButton(onPressed: widget.group.group_type != "info" ? () => sendMessage() : null, child: Text("Send")),
              )
            ],
          )
        ]));
  }

  // i wrote this in 5 minutes, shut up
  Widget holdPopup(BuildContext context, Message message) {
    var t = AppLocalizations.of(context)!;
    _updateMessageController = TextEditingController(text: getTextWithoutHtml(message.text!.trim()));
    bool _update = false;
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: Text(t.groupWhatToDo),
        actions: [
          _update
              ? TextFormField(
                  controller: _updateMessageController,
                )
              : Container(),
          !_update
              ? TextButton(
                  onPressed: () => setState(() {
                    _update = true;
                  }),
                  child: Text(t.groupEdit),
                )
              : TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    sendUpdateMessage(message.id!, _updateMessageController.text);
                  },
                  style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.green[600]!)),
                  child: Text(t.groupSave),
                ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              sendDestroyMessage(message.id!);
            },
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            child: Text(t.groupRemove),
          ),
        ],
      );
    });
  }

  bool isThisUser(String messageUser) {
    if (thisUser == null) return false;
    return messageUser == thisUser!.firstname! + " " + thisUser!.lastname!;
  }

  void connectToActionCable() {
    locator<MessagesService>().getActionCableToken().then((token) {
      _channelParams = {"group_id": widget.group.id};

      // NOTE: ActionCable dosent work on stage, why? i dunno, ask förberg or smth
      // Connects to websocket with the token and sets origin because ActionCable respects CORS
      cable = ActionCable.Connect("${Environment.CABLE_URL}?token=$token", headers: {"Origin": Environment.API_URL}, onConnected: () {
        print("connected");

        // Connects to the channel with the group id
        subscribeToChannel();
      }, onConnectionLost: () {
        print("connection lost");
      }, onCannotConnect: () {
        print("cannot connect");
      });
    });
  }

  void subscribeToChannel() {
    cable!.subscribe(_channelName, channelParams: _channelParams, onMessage: (data) {
      print(data);
      if (data["action"] == "create") {
        receivedMessage(Message.fromJson(data["message"]["message"]));
      } else if (data["action"] == "destroy") {
        destroyMessage(data["message_id"]);
      } else if (data["action"] == "update") {
        updateMessage(Message.fromJson(data["message"]["message"]));
      }
    });
  }

  void unsubscribeToChannel() {
    cable!.unsubscribe(_channelName, channelParams: _channelParams);
  }

  void pauseApp() {
    unsubscribeToChannel();
    cable!.disconnect();
  }

  void resumeApp() {
    connectToActionCable();
    subscribeToChannel();
  }

  void sendMessage() {
    cable!.performAction(_channelName, action: "send_message", actionParams: {"content": _controller.text, "group_id": widget.group.id}, channelParams: _channelParams);
    _controller.clear();
  }

  void sendUpdateMessage(int messageId, String text) {
    cable!.performAction(_channelName, action: "update_message", actionParams: {"message_id": messageId, "content": text}, channelParams: _channelParams);
  }

  void sendDestroyMessage(int messageId) {
    cable!.performAction(_channelName, action: "destroy_message", actionParams: {"message_id": messageId}, channelParams: _channelParams);
  }

  void receivedMessage(Message message) {
    setState(() {
      messages.add(message);
      _pagingController.itemList = messages;
      _pagingController.refresh();
    });
  }

  void updateMessage(Message message) {
    setState(() {
      messages[messages.indexWhere((element) => element.id == message.id)] = message;
      _pagingController.itemList = messages;
      _pagingController.refresh();
    });
  }

  void destroyMessage(int messageId) {
    setState(() {
      messages.removeAt(messages.indexWhere((element) => element.id == messageId));
      _pagingController.itemList = messages;
      _pagingController.refresh();
    });
  }

  void loadMoreMessages(int groupId, int page) {
    locator<MessagesService>().getMoreMessages(groupId, page).then((value) {
      if (locator<MessagesService>().pageCount == page) {
        _pagingController.appendLastPage(value);
      } else {
        _pagingController.appendPage(value, page + 1);
      }
      setState(() {
        messages.addAll(value);
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state != AppLifecycleState.resumed) {
      resumeApp();
    } else {
      pauseApp();
    }
  }
}
