import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/gallery/image_browser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:fsek_mobile/environments/environment.dart';




class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, required this.album}) : super(key: key);
  final AlbumRead album;
  
    @override
  _AlbumPageState createState() => _AlbumPageState();

}
class _AlbumPageState extends State<AlbumPage> {
  List<int>? imgIds;
  Map<int, Uint8List> _imageCache = {};



  @override 
  void initState() {
    super.initState();
    loadImgIds(widget.album.id);
  }

  void loadImgIds(int albumId) async {
    final idList = await ApiService.apiClient.getImgApi().imgGetAlbumImages(albumId: albumId);
    setState(() {
      this.imgIds = idList.data!.toList();
    });

  }

  @override
  build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if(imgIds == null) {
      return Center(child: CircularProgressIndicator(),);
    } 

    return Scaffold(
        appBar: AppBar(
          title: Text(
            t.localeName == "sv" ? widget.album.titleSv : widget.album.titleEn,
          ),
          actions: [],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: imgIds!.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<ImageProvider>(
                    future: _fetchImage(imgIds![index]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      } else if (snapshot.hasError || !snapshot.hasData) {
                        return const Image(
                          image: AssetImage("assets/img/f_logo.png"),
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Ink.image(
                          image: snapshot.data!,
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () => openImageBrowser(context, index),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.surface),
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
                    t.localeName == "sv" ? widget.album.titleSv : widget.album.titleEn,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(t.localeName == "sv" ? widget.album.descSv : widget.album.descEn),
                  SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                          text: t.albumPhotographers,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: Theme.of(context).primaryColor),
                          children: [
                        TextSpan(
                            text: widget.album.photographer.isNotEmpty
                                ? widget.album.photographer
                                    .map((photograper) =>
                                        "${photograper.user.firstName} ${photograper.user.lastName}")
                                    .join(", ")
                                : t.albumNoPhotographers,
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

  Future<List<Widget>> generateImages(BuildContext context) async {
    List<Widget> result = [];

    for (int i = 0; i < imgIds!.length; i++) {
      final image = await _fetchImage(imgIds![i]);
      Ink ink = Ink.image(
          image: image,
          fit: BoxFit.cover,
          child: InkWell(
            onTap: () => openImageBrowser(context, i),
          ));
      result.add(ink);
    }
    return result;
  }

  Future<ImageProvider<Object>> _fetchImage(int id) async {
    if(_imageCache.containsKey(id)) {
      return MemoryImage(_imageCache[id]!);
    }

    try {
      final url = "${Environment.API_URL}/img/images/$id/small";
      // final url = "https://backend.fsektionen.se/img/images/$id/small";
      final response = await http.get(Uri.parse(url),
          headers: {"Authorization": "Bearer ${ApiService.access_token}"});

      if (response.statusCode != 200) {
        print("HTTP error: ${response.statusCode}");
        print("Response body: ${String.fromCharCodes(response.bodyBytes)}");
        return const AssetImage("assets/img/f_logo.png");
      }

      if (response.bodyBytes.isEmpty) {
        print("Received empty response");
        return const AssetImage("assets/img/f_logo.png");
      }

      _imageCache[id] = response.bodyBytes;

      return MemoryImage(response.bodyBytes);
    } catch (e) {
      print("Error fetching image: $e");
      return AssetImage("assets/img/f_logo.png");
    }
  }

  void openImageBrowser(BuildContext context, int imageIndex) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageBrowserPage(
                  imgIds: imgIds!,
                  album: widget.album,
                  initial: imageIndex,
                )));
  }
}
