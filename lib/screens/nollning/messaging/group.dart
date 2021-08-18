import 'package:action_cable/action_cable.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/messages/message.dart';
import 'package:fsek_mobile/models/messages/messaging_group.dart';
import 'package:fsek_mobile/models/user/user.dart';
import 'package:fsek_mobile/services/messages.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// This file is chaos, but it workss
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

  @override
  void initState() {
    _controller = TextEditingController(text: widget.group.group_type == "info" ? "Chatten är skrivskyddad" : "");
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meddelanden'),
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
                builderDelegate: PagedChildBuilderDelegate<Message>(
                  itemBuilder: (context, message, index) {
                  if (message.name == null || message.text == null) return Container();
                  Widget _date = Container(); //Container is basically null :D
                  if(messages.length > 0 && messages.length > index+1 && messages[index+1].day != message.day) {
                    _date = Padding(child: Text(message.day!), padding: EdgeInsets.fromLTRB(0, 16, 0, 5));
                  }

                  return Column(
                    children: [
                      _date,
                      Row(mainAxisAlignment: isThisUser(message.name!) ? MainAxisAlignment.end : MainAxisAlignment.start, children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 2 / 3,
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
                                    Padding(padding: EdgeInsets.fromLTRB(0, 3, 0, 0), child: RichText(text: TextSpan(text: message.text!.trim(), style: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.grey)))),
                                    Row(children: [Text(message.time!)],mainAxisAlignment: MainAxisAlignment.end,)
                                  ],
                                ),
                              ))))]),
                    ],
                  );
                  }
                ),
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

  Widget _getTextField() {
    return Container(
      color: Colors.grey[200],
      child: Stack(children: [
        TextFormField(
          enabled: widget.group.group_type != "info",
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
          )),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextButton(
                onPressed: widget.group.group_type != "info" ? () => sendMessage() : null, 
                child: Text("Send")),
            )
          ],)
      ]));
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
      cable = ActionCable.Connect("wss://stage.fsektionen.se/cable?token=$token", headers: {"Origin": "https://stage.fsektionen.se"}, onConnected: () {
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
    cable!.subscribe(_channelName , channelParams: _channelParams, onMessage: (data) {
      print(data);
      if(data["action"] == "create") {
        receivedMessage(Message.fromJson(data["message"]["message"]));
      }
      else if(data["action"] == "destroy") {
        destroyMessage(data["message_id"]);
      }
      else if(data["action"] == "update") {
        updateMessage(data["message"]["message"] as Message);
      }
    });
  }

  void unsubscribeToChannel() {
    cable!.unsubscribe(
      _channelName,
      channelParams: _channelParams
    );
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
    });
  }

  void destroyMessage(dynamic messageId) {
    int? id = int.tryParse(messageId);
    if(id == null) {
      print("could not destroy message (not found): " + messageId);
      return;
    }
    setState(() {
      messages.removeAt(messages.indexWhere((element) => element.id == id));
    });
  }

  void loadMoreMessages(int groupId, int page) {
    locator<MessagesService>().getMoreMessages(groupId, page).then((value) {
      if(locator<MessagesService>().pageCount == page) {
        _pagingController.appendLastPage(value);
      }
      else {
        _pagingController.appendPage(value, page + 1);
      }
      setState(() {
        messages.addAll(value);
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state != AppLifecycleState.resumed) {
      resumeApp();
    }
    else {
      pauseApp();
    }
  }
}
