import 'package:flutter/material.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/screens/gallery/image_browser.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key, required this.album}) : super(key: key);

  final Album album;

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[50]),
              child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.fromLTRB(8, 0 ,8 ,8),
                title: 
                  Text(
                    album.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.apply(color: Colors.orange[800]),
                  ),
                children: [
                  SizedBox(
                    height: 16,
                    width: double.infinity,
                  ),
                  Text(album.description ?? "-", 
                    textAlign: TextAlign.start,),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Fotografter: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.apply(color: Colors.orange[800]),
                          children: [
                        TextSpan(
                            text: album.photographers?.join(", ") ??
                                "No photographers",
                            style: Theme.of(context).textTheme.bodyText2)
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: generateImages(context),
                ),
              ),
            )
          ],
        ));
  }

  Widget generateDiscripton() {
    return Container();
  }

  List<Widget> generateImages(BuildContext context) {
    List<Widget> result = [];
    for (int i = 0; i < album.images!.length; i++) {
      result.add(Ink.image(
        image: NetworkImage(
            "${Environment.API_URL}${album.images![i].file!.thumb!}"),
        fit: BoxFit.cover,
        child: InkWell(
          onTap: () => openImageBrowser(context, i),
        ),
      ));
    }

    return result;
  }

  void openImageBrowser(BuildContext context, int imageIndex) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageBrowserPage(
                  album: album,
                  initial: imageIndex,
                )));
  }
}
