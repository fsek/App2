import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/notiser/notis.dart';
import 'package:fsek_mobile/screens/event/event.dart';
import 'package:fsek_mobile/services/notiser.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsPage extends StatefulWidget {
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final Map<String, Style> _htmlStyle = {
    "body": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
    "p": Style(
        padding: HtmlPaddings.zero,
        margin: Margins.zero,
        fontSize: FontSize(17))
  };

  final PagingController<int, NewsRead> _pagingController = PagingController(
    getNextPageKey: (state) => (state.keys?.last ?? 0) + 1,
    fetchPage: (pageKey) async {
      final response =
          await ApiClient().getNewsApi().newsGetPaginatedNews(pageNbr: pageKey);

      if (response.data == null) {
        throw Exception("Failed to load news");
      }
      return response.data!.toList();
    },
  );

  @override
  void initState() {
    // _pagingController.addPageRequestListener((pageKey) {
    //   loadMoreMessages(pageKey);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return PagingListener(
        controller: _pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedListView<int, NewsRead>.separated(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                  itemBuilder: (context, news, index) {
                return Card(
                    child: InkWell(
                        onTap: () => tempNotis(news),
                        child: ListTile(
                            title: Text((t.localeName == "sv"
                                        ? news.titleSv
                                        : news.titleEn)
                                    .isEmpty
                                ? t.homeTitleUntranslated
                                : (t.localeName == "sv"
                                    ? news.titleSv
                                    : news.titleEn)),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${news.authorId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.normal)),
                                  SizedBox(height: 6),
                                  Text(
                                    news.createdAt.toString().substring(0, 16),
                                    style: TextStyle(fontSize: 12),
                                  )
                                ]),
                            isThreeLine: true,
                            trailing: ((news.pinnedFrom != null) ||
                                    (news.pinnedTo != null))
                                ? Icon(Icons.push_pin_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary)
                                : SizedBox.shrink())));
              }),
              separatorBuilder: (context, index) => const Divider(),
            ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  // void loadMoreMessages(int page) {
  //   locator<NotiserService>().getMoreMessages(page).then((value) {
  //     if (value.meta?.next_page == null) {
  //       _pagingController.appendLastPage(value.notifications ?? []);
  //     } else {
  //       _pagingController.appendPage(value.notifications ?? [], page + 1);
  //     }
  //   });
  // }

  void tempNotis(NewsRead news) {}

  // void seeNotis(Notis notis) {
  //   locator<NotiserService>().visitNotis(notis.id!);
  //   setState(() {
  //     _pagingController.itemList!
  //         .singleWhere((element) => element.id == notis.id)
  //         .visited = true;
  //   });
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => EventPage(eventId: notis.event_id!)));
  // }
}



// @override
//   Widget build(BuildContext context) {
//     var t = AppLocalizations.of(context)!;
//     return Container(
//       child: PagedListView<int, Notis>(
//         pagingController: _pagingController,
//         shrinkWrap: true,
//         builderDelegate: PagedChildBuilderDelegate<Notis>(
//             itemBuilder: (context, notis, index) {
//           if (notis.data == null) return Container();

//           return Card(
//               color: notis.visited ?? false
//                   ? Theme.of(context).colorScheme.surface
//                   : Theme.of(context).colorScheme.surfaceTint,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () => seeNotis(notis),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Html(
//                           data: notis.data?["body"],
//                           style: _htmlStyle,
//                         ),
//                         SizedBox(height: 4),
//                         notis.data?["extra"] != null
//                             ? Text(notis.data!["extra"]!)
//                             : Container(),
//                         Text(t.notificationsSent +
//                             (DateFormat('EEE d LLL y kk:mm')
//                                 .format(notis.created_at!))),
//                       ]),
//                 ),
//               ));
//         }, noItemsFoundIndicatorBuilder: (context) {
//           return Container(
//               height: 400,
//               child: Center(
//                   child: Text(t.notificationsNone,
//                       style: Theme.of(context).textTheme.titleLarge)));
//         }),
//       ),
//     );
//   }