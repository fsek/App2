import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/models/home/news.dart';
import 'package:fsek_mobile/util/time.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';

class SingleNewsPage extends StatelessWidget {
  const SingleNewsPage({Key? key, required this.news}) : super(key: key);

  final NewsRead news;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (t.localeName == "en") {
      return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                    child: Text(news.titleEn,
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
                    child: Html(
                        data: news.contentEn,
                        style: {"p": Style(lineHeight: LineHeight(1.2))},
                        onLinkTap: (String? url, Map<String, String> attributes,
                            element) {
                          launchUrl(Uri.parse(url!));
                        }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(children: [
                    Text(
                      "${news.author.firstName} ${news.author.lastName}",
                    ),
                    Spacer(),
                    Text(Time.format(news.createdAt, "%d %M %Y %h:%m"))
                  ]),
                ),
                // Padding(
                //   padding: EdgeInsets.all(8),
                //   child: news.image == null
                //       ? SizedBox.shrink()
                //       : Image.network(news.image!),
                // )
              ],
            ),
          ));
    }

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Text(news.titleSv,
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
                  child: Html(
                      data: news.contentSv,
                      style: {"p": Style(lineHeight: LineHeight(1.2))},
                      onLinkTap: (String? url, Map<String, String> attributes,
                          element) {
                        launchUrl(Uri.parse(url!));
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(children: [
                  Text(
                    "${news.author.firstName} ${news.author.lastName}",
                  ),
                  Spacer(),
                  Text(Time.format(news.createdAt, "%d %M %Y %h:%m"))
                ]),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8),
              //   child: news.image == null
              //       ? SizedBox.shrink()
              //       : Image.network(news.image!),
              // )
            ],
          ),
        ));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     bool translated = (news.title != "" && news.content != null);
//     var t = AppLocalizations.of(context)!;
//     if (translated) {
//       return Scaffold(
//           appBar: AppBar(),
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
//                     child: Text(news.title!,
//                         style: Theme.of(context).textTheme.titleLarge),
//                   ),
//                 ),
//                 Divider(
//                   thickness: 1,
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
//                     child: Html(
//                         data: news.content!,
//                         style: {"p": Style(lineHeight: LineHeight(1.2))},
//                         onLinkTap: (String? url, Map<String, String> attributes,
//                             element) {
//                           launchUrl(Uri.parse(url!));
//                         }),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                   child: Row(children: [
//                     Text(
//                       news.user!.name!,
//                     ),
//                     Spacer(),
//                     Text(Time.format(news.created_at!, "%d %M %Y %h:%m"))
//                   ]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8),
//                   child: news.image == null
//                       ? SizedBox.shrink()
//                       : Image.network(news.image!),
//                 )
//               ],
//             ),
//           ));
//     }

//     return Scaffold(
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
//                   child: Text(
//                       news.title == "" || news.title == null
//                           ? t.homeTitleUntranslated
//                           : news.title!,
//                       style: Theme.of(context).textTheme.titleLarge),
//                 ),
//               ),
//               Divider(
//                 thickness: 1,
//               ),
//               Container(
//                 child: Padding(
//                   padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0),
//                   child: Text(
//                       "${t.newsNotAvailableOne}${news.user!.name}${t.newsNotAvailableTwo}",
//                       style: Theme.of(context).textTheme.bodyLarge),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
