import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class ContactPage extends StatefulWidget {
  final String? initPostNameSv;

  ContactPage({Key? key, this.initPostNameSv}) : super(key: key);

  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Map<PostRead, List<SimpleUserRead>>? postUserMap;
  List<PostRead>? posts;
  PostRead? currentPost;
  String localMessage = "";
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitData();
  }

  void _loadInitData() async {
    final response =
        await ApiService.apiClient.getPostsApi().postsGetAllPosts();
    final responseData = response.data;

    Map<PostRead, List<SimpleUserRead>> _postUserMap = {};
    List<PostRead> postList = [];

    if (responseData != null) {
      postList = responseData.toList();
      postList.removeWhere((post) => post.councilId == 17);
      postList.sort((a, b) => a.nameSv.compareTo(b.nameSv));
      for (int i = 0; i < postList.length; i++) {
        final userResponse = await ApiService.apiClient
            .getPostsApi()
            .postsGetAllUsersWithPost(postId: postList[i].id);
        final userResponseData = userResponse.data;
        if (userResponseData != null) {
          _postUserMap
              .putIfAbsent(postList[i], () => [])
              .addAll(userResponseData.toList());
        } else {
          _postUserMap.putIfAbsent(postList[i], () => []);
        }
      }
    }

    setState(() {
      this.postUserMap = _postUserMap;
      this.posts = postList;
      this.currentPost = (posts != null && posts!.isNotEmpty)
          ? (widget.initPostNameSv != null
              ? posts!.firstWhere(
                  (post) => post.nameSv == widget.initPostNameSv,
                  orElse: () => posts!.first)
              : posts!.first)
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    BoxDecoration box = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 2, color: Theme.of(context).colorScheme.onPrimary));
    if (posts == null || posts!.isEmpty) {
      return Scaffold(
          appBar: AppBar(
              title: Text(t.contactContact,
                  style: Theme.of(context).textTheme.headlineSmall)),
          body: Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary)));
    }

    return Scaffold(
        appBar: AppBar(
            title: Text(t.contactContact,
                style: Theme.of(context).textTheme.headlineSmall)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Container(
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColorLight),
                  child: Stack(children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Container(decoration: box),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                              t.localeName == "sv"
                                  ? currentPost!.nameSv
                                  : currentPost!.nameEn,
                              style: Theme.of(context).textTheme.titleMedium)),
                    ),
                  ]),
                ),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
                    child: Text(t.contactPerson,
                        style: Theme.of(context).textTheme.titleSmall),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                    autofocus: false,
                    value: currentPost!,
                    isExpanded: true,
                    onChanged: (PostRead? post) {
                      setState(() {
                        currentPost = post;
                      });
                    },
                    items: posts!.map((post) {
                      return DropdownMenuItem(
                          child: Text(
                              t.localeName == "sv" ? post.nameSv : post.nameEn),
                          value: post);
                    }).toList()),
              ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 24, 8, 4),
                    child: Text(t.contactDescription,
                        style: Theme.of(context).textTheme.titleSmall),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 6, 8, 8),
                  child: Html(
                      data: t.localeName == "sv"
                          ? currentPost!.descriptionSv
                          : currentPost!
                              .descriptionEn) //Make into html when that dependency is merged
                  ),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 24, 8, 4),
                    child: Text(t.contactInfo,
                        style: Theme.of(context).textTheme.titleSmall),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 6, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "Email: ",
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: currentPost!.email,
                          style: TextStyle(color: Color(0xFF5269D1)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _launchMail(currentPost!.email))
                    ])),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: t.contactHeldBy,
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: _getPostUserNames(),
                          style: Theme.of(context).textTheme.bodyMedium)
                    ]))
                  ],
                ),
              ),
              // Container(
              //     width: double.infinity,
              //     decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceVariant),
              //     child: Padding(
              //       padding: EdgeInsets.fromLTRB(8, 24, 8, 4),
              //       child: Text(t.contactMessage,
              //           style: Theme.of(context).textTheme.titleSmall),
              //     )),
              // SizedBox(
              //   width: double.infinity,
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              //     child: TextField(
              //       autofocus: false,
              //       controller: controller,
              //       maxLines: 4,
              //       decoration:
              //           InputDecoration(hintText: t.contactWriteMessage),
              //       onChanged: (input) => localMessage = input,
              //     ),
              //   ),
              // ),
              // Container(
              //   width: double.infinity,
              //   height: 30,
              //   decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceVariant),
              // ),
              // Container(
              //     width: double.infinity,
              //     height: 50,
              //     child: Ink(
              //       decoration: BoxDecoration(
              //           color: Theme.of(context).primaryColorLight),
              //       child: InkWell(
              //           child: Center(
              //               child: Text(
              //             t.contactSend,
              //             style: Theme.of(context).textTheme.labelLarge!.copyWith(
              //                 color: Theme.of(context).colorScheme.onPrimary
              //             ),
              //           )),
              //           onTap: () => _sendMessage(localMessage)),
              //     )),
              Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest),
              ),
            ],
          ),
        ));

    // TODO this is for when we have images later
    // if (currentContact!.avatar!["avatar"]!["thumb"]["url"] != null) {
    //   box = BoxDecoration(
    //       image: DecorationImage(
    //         image: NetworkImage(
    //             "${Environment.API_URL}${currentContact!.avatar!["avatar"]!["thumb"]["url"].toString()}"),
    //       ),
    //       shape: BoxShape.circle,
    //       border: Border.all(width: 2, color: Theme.of(context).colorScheme.onPrimary));
    // }
  }

  Future<void> _launchMail(String email) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(launchUri);
  }

  String _getPostUserNames() {
    List<String> names = [];
    postUserMap![currentPost]?.forEach((user) {
      names.add("${user.firstName} ${user.lastName}");
    });

    return names.length != 0 ? names.join(", ") : "V.A. Kant";
  }
}
