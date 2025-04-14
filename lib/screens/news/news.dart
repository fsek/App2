import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/models/home/news.dart';
import 'package:fsek_mobile/screens/news/single_news.dart';
import 'package:fsek_mobile/services/home.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final PagingController<int, NewsRead> _pagingController =
      PagingController(getNextPageKey: (state) {
    if (state.items != null) {
      if ((state.items!.length % 20) != 0) {
        //The value 20 here is the news per page from the backend
        //This implementation is really cursed since if the amount is divisible by 20,
        //the user will be able to basicly spam requests and should probably be changed.
        return null;
      }
    }

    return (state.keys?.last ?? -1) + 1;
  }, fetchPage: (pageKey) async {
    if (pageKey == 0) {
      try {
        final normalResponse = await ApiClient()
            .getNewsApi()
            .newsGetPaginatedNews(pageNbr: pageKey);

        final pinnedResponse =
            await ApiClient().getNewsApi().newsGetPinnedNews();

        if (normalResponse.data == null) {
          throw Exception("Failed to load news");
        }

        final pinnedNews = pinnedResponse.data!;
        final normalNews = normalResponse.data!;

        final pinnedIds = pinnedNews.map((item) => item.id).toSet();
        final filteredNews =
            normalNews.where((item) => !pinnedIds.contains(item.id)).toList();

        final combinedNews = [...pinnedNews, ...filteredNews];

        return combinedNews;
      } catch (e, st) {
        print("Error fetching news: $e\n$st");
        rethrow;
      }
    } else {
      try {
        final response = await ApiClient()
            .getNewsApi()
            .newsGetPaginatedNews(pageNbr: pageKey);
        if (response.data == null) {
          throw Exception("Failed to load news");
        }
        return response.data!.toList();
      } catch (e, st) {
        print("Error fetching news: $e\n$st");
        rethrow;
      }
    }
  });

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onRefresh() async {
    _pagingController.refresh();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return RefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: PagingListener(
          controller: _pagingController,
          builder: (context, state, fetchNextPage) =>
              PagedListView<int, NewsRead>(
                state: state,
                fetchNextPage: fetchNextPage,
                builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, news, index) {
                  return Card(
                      child: InkWell(
                          onTap: () => openNews(news),
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
                                      news.createdAt
                                          .toString()
                                          .substring(0, 16),
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ]),
                              isThreeLine: true,
                              trailing: ((news.pinnedFrom != null) &&
                                      (news.pinnedTo != null) &&
                                      (news.pinnedFrom!
                                              .isBefore(DateTime.now()) &&
                                          (news.pinnedTo!
                                              .isAfter(DateTime.now()))))
                                  ? Icon(Icons.push_pin_outlined,
                                      color:
                                          Theme.of(context).colorScheme.primary)
                                  : SizedBox.shrink())));
                }),
              )),
    );
  }

  void openNews(NewsRead newsRead) {
    // redirect to other page and shit
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SingleNewsPage(news: newsRead)));
  }

  // Widget createNewsCard() {
  //   var t = AppLocalizations.of(context)!;
  //   return RefreshIndicator(
  //       onRefresh: () => _onRefresh(),
  //       child: Container(
  //         child: PagedListView<int, News>(
  //           pagingController: _pagingController,
  //           shrinkWrap: true,
  //           builderDelegate: PagedChildBuilderDelegate<News>(
  //               itemBuilder: (context, news, index) {
  //             return Card(
  //                 child: InkWell(
  //                     onTap: () => openNews(news),
  //                     child: ListTile(
  //                         title: Text((news.title == "" || news.title == null)
  //                             ? t.homeTitleUntranslated
  //                             : news.title!),
  //                         subtitle: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(news.user!.name!,
  //                                   style: Theme.of(context)
  //                                       .textTheme
  //                                       .labelMedium
  //                                       ?.copyWith(
  //                                           fontWeight: FontWeight.normal)),
  //                               SizedBox(height: 6),
  //                               Text(
  //                                 news.created_at.toString().substring(0, 16),
  //                                 style: TextStyle(fontSize: 12),
  //                               )
  //                             ]),
  //                         isThreeLine: true,
  //                         trailing: (news.is_pinned ?? false)
  //                             ? Icon(Icons.push_pin_outlined,
  //                                 color: Theme.of(context).colorScheme.primary)
  //                             : SizedBox.shrink())));
  //           }, noItemsFoundIndicatorBuilder: (context) {
  //             return Container(
  //                 height: 400,
  //                 child: Center(
  //                     child: Text(t.homeNoNews,
  //                         style: Theme.of(context).textTheme.titleLarge)));
  //           }),
  //         ),
  //       ));
  //  }
}
