// import 'package:flutter/material.dart';
// import 'package:fsek_mobile/models/messages/messaging_group.dart';
// import 'package:fsek_mobile/services/messages.service.dart';
// import 'package:fsek_mobile/services/service_locator.dart';
// import 'package:fsek_mobile/l10n/app_localizations.dart';

// import 'group.dart';

// class MessagesPage extends StatefulWidget {
//   @override
//   _MessagesPageState createState() => _MessagesPageState();
// }

// class _MessagesPageState extends State<MessagesPage> {
//   List<MessagingGroup> groups = [];

//   void initState() {
//     locator<MessagesService>().getGroups().then((value) {
//       setState(() {
//         groups = value
//           ..sort((a, b) => -a.group_user!.unread_count!
//               .compareTo(b.group_user!.unread_count!));
//       });
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var t = AppLocalizations.of(context)!;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(t.messagesMessages),
//         ),
//         body: ListView(
//           children: _buildList(groups),
//         ));
//   }

//   List<Widget> _buildList(List<MessagingGroup> groups) {
//     return groups.map((group) {
//       return Card(
//           child: InkWell(
//               onTap: () => openGroup(group),
//               child: ListTile(
//                 title: Text(group.name!),
//                 subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ...group.messages!.map(
//                         (e) => Padding(
//                             padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
//                             child: RichText(
//                                 text: TextSpan(
//                                     text: e!.user!["name"],
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .apply(
//                                             color: Colors.grey,
//                                             fontStyle: FontStyle.italic),
//                                     children: [
//                                   TextSpan(
//                                     text: ": " +
//                                         truncateWithEllipsis(
//                                             30, e.content!.trim()),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium!
//                                         .apply(
//                                             color: Colors.grey,
//                                             fontStyle: FontStyle.normal),
//                                   ),
//                                 ]))),
//                       )
//                     ]),
//                 isThreeLine: true,
//               )));
//     }).toList();
//   }

//   String truncateWithEllipsis(int cutoff, String myString) {
//     return (myString.length <= cutoff)
//         ? myString
//         : '${myString.substring(0, cutoff)}...';
//   }

//   void openGroup(MessagingGroup group) {
//     //redirect to other page and shit
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => GroupPage(group: group)));
//   }
// }
