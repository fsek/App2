import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/gallery/image_browser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';



class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key, required this.album}) : super(key: key);

  final AlbumRead album;

  @override
  build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: Text(t.localeName == "sv" ? album.titleSv : album.titleEn,),
          actions: [],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FutureBuilder<List<Widget>>(
                  future: generateImages2(context),
                  builder:(context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error loading images"),);
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text("No images available"),);
                    } else {
                      return GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        children: snapshot.data!,
                      );
                    }
                  },
                
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
              child: ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                title: Text(
                  "Mer info",
                ),
                children: [
                  SizedBox(
                    height: 8,
                    width: double.infinity,
                  ),
                  Text(
                   t.localeName == "sv" ? album.titleSv : album.titleEn,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    t.localeName == "sv" ? album.descSv : album.descEn),
                  SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                          text: t.albumPhotographers,
                          style: Theme.of(context).textTheme.bodyMedium?.apply(
                              color: Theme.of(context).primaryColor),
                          children: [
                        TextSpan(
                            text: album.photographer.isNotEmpty ? 
                              album.photographer.map((photograper) => "${photograper.user.firstName} ${photograper.user.lastName}").join(", ") :
                              t.albumNoPhotographers,
                            style: Theme.of(context).textTheme.bodyMedium)
                      ])),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget generateDiscripton() {
    return Container();
  }



  Future<List<Widget>> generateImages2(BuildContext context) async {
    List<Widget> result = [];

    for(int i = 0; i < album.imgs.length; i++){
      final image = await fetchImage(album.imgs[i].id);
      Ink ink = Ink.image(
        image: image,
        fit: BoxFit.cover,
        child: InkWell(
          onTap: () => openImageBrowser(context, i),
        )
      );
      result.add(ink);
    }
    return result;
  }

  Future<ImageProvider<Object>> fetchImage(int id) async {
  try {
    final response = await ApiService.apiClient.dio.get(
      "/img/$id", 
      options: Options(responseType: ResponseType.bytes));

    return MemoryImage(Uint8List.fromList(response.data!));
    
  } catch (e) {
    print("Error fetching image: $e");
    return AssetImage("assets/img/f_logo.png");
  }
}


  List<Widget> generateImages(BuildContext context) {
    List<Widget> result = [];
    for (int i = 0; i < album.imgs.length; i++) {
      Ink ink = Ink.image(
          image: AssetImage("assets/img/f_logo.png"),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: () => openImageBrowser(context, i),
          )); //default pic


      // if (album.images![i].file!.thumb!["url"] != null) {
      //   ink = Ink.image(
      //       image: NetworkImage(
      //           "${Environment.API_URL}${album.images![i].file!.thumb!["url"]}"),
      //       fit: BoxFit.cover,
      //       child: InkWell(
      //         onTap: () => openImageBrowser(context, i),
      //       ));
      // }
      result.add(ink);
    }

    return result;
  }

  void openImageBrowser2(BuildContext context, int imageIndex) {}

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
