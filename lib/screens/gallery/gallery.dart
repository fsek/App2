import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/screens/gallery/album.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:linkable/constants.dart';
import 'package:http/http.dart' as http;

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<AlbumRead>? allGalleries;
  List<AlbumRead>? selectedGalleries;
  int? selectedYear;
  void initState() {
    ApiService.apiClient.getAlbumsApi().albumsGetAlbums().then((value) {
      setState(() {
        this.allGalleries = value.data!.toList();
        this.selectedYear =
            allGalleries!.reduce((a, b) => a.year > b.year ? a : b).year;
        this.selectedGalleries =
            allGalleries!.where((item) => item.year == selectedYear).toList();
        // selectedYear = galleries![0].year;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (allGalleries == null || selectedGalleries == null) {
      return Scaffold(
        appBar: AppBar(title: Text(t.galleryTitle)),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (selectedGalleries!.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(t.galleryTitle)),
        body: Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.surface),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: DropdownButton(
                iconDisabledColor: Theme.of(context).colorScheme.surface,
                iconEnabledColor: Theme.of(context).colorScheme.surface,
                dropdownColor: Theme.of(context).colorScheme.surface,
                elevation: 2,
                isExpanded: true,
                value: selectedYear,
                items: allGalleries!
                    .map((item) => item.year)
                    .toSet()
                    .toList()
                    .map((year) => DropdownMenuItem(
                        child: Text(year.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                        value: year))
                    .toList(),
                onChanged: (int? newYear) {
                  setState(() {
                    if (selectedYear != newYear) {
                      selectedYear = newYear!;
                      selectedGalleries = allGalleries!
                          .where((item) => item.year == selectedYear)
                          .toList();
                    }
                  });
                })),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.galleryTitle,
        ),
      ),
      body: Column(children: [
        Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.surface),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: DropdownButton(
                iconDisabledColor: Theme.of(context).colorScheme.surface,
                iconEnabledColor: Theme.of(context).colorScheme.surface,
                dropdownColor: Theme.of(context).colorScheme.surface,
                elevation: 2,
                isExpanded: true,
                value: selectedYear,
                items: allGalleries!
                    .map((item) => item.year)
                    .toSet()
                    .toList()
                    .map((year) => DropdownMenuItem(
                        child: Text(year.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                        value: year))
                    .toList(),
                onChanged: (int? newYear) {
                  setState(() {
                    if (selectedYear != newYear) {
                      selectedYear = newYear!;
                      selectedGalleries = allGalleries!
                          .where((item) => item.year == selectedYear)
                          .toList();
                    }
                  });
                })),
        Expanded(
            child: GridView.count(
          padding: EdgeInsets.all(12),
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: generateAlbumThumbnails(),
          shrinkWrap: true,
        ))
      ]),
    );
  }

  List<Widget> generateAlbumThumbnails() {
    var t = AppLocalizations.of(context)!;
    if (selectedGalleries == null) {
      return [];
    }
    List<Widget> result = [];
    for (AlbumRead elem in selectedGalleries!) {
      result.add(Stack(children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Column(children: [
            Text(
              t.localeName == "sv" ? elem.titleSv : elem.titleEn,
              style: Theme.of(context).textTheme.titleLarge?.apply(
                    color: Colors.white,
                    fontSizeDelta: -4,
                  ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.date_range,
                        color: Theme.of(context).colorScheme.primary),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      DateFormat('d MMM yyyy').format(elem.date),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: Colors.white),
                    )
                  ]),
                  SizedBox(
                    height: 3,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.location_pin,
                        color: Theme.of(context).colorScheme.primary),
                    SizedBox(
                      width: 2,
                    ),
                    Flexible(
                      child: Text(
                        elem.location.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.apply(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 3,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.image,
                        color: Theme.of(context).colorScheme.primary),
                    SizedBox(
                      width: 2,
                    ),
                    // Text(
                    //   elem.imgs.length.toString(),
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyMedium
                    //       ?.apply(color: Colors.white),
                    // ),
                  ]),
                ],
              ),
            )
          ]),
        ),
            buildThumbnailImage(elem)
      ]));
    }
    return result;
  }

  void goToAlbum(int id) {
    ApiService.apiClient
        .getAlbumsApi()
        .albumsGetOneAlbum(albumId: id)
        .then((album) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => AlbumPage(album: album.data!))));
    });
  }

  Future<ImageProvider<Object>> _fetchCoverImage(int albumId) async {
    try {
      final imgs = await ApiService.apiClient.getImgApi().imgGetAlbumImages(albumId: albumId);

      if(imgs.data!.isEmpty) {
        return const AssetImage("assets/img/f_logo.png");
      }

      final url = "${Environment.API_URL}/img/images/${imgs.data!.first}/small";

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

      return MemoryImage(response.bodyBytes);
    } catch (e) {
      print("Error fetching image: $e");
      return AssetImage("assets/img/f_logo.png");
    }
  }

  // Future<ImageProvider<Object>> _fetchImage(int id) async {
  //   try {
  //     final response = await ApiService.apiClient.dio
  //         .get("/img/$id", options: Options(responseType: ResponseType.bytes));

  //     return MemoryImage(Uint8List.fromList(response.data!));
  //   } catch (e) {
  //     print("Error fetching image: $e");
  //     return AssetImage("assets/img/f_logo.png");
  //   }
  // }

  Widget buildThumbnailImage(AlbumRead album) {
    return FutureBuilder<ImageProvider>(
      future: _fetchCoverImage(album.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Ink.image(
            image: snapshot.data!,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            child: InkWell(
              onTap: () => goToAlbum(album.id),
            ),
          );
        } else {
          return Ink.image(
            image: AssetImage("assets/img/f_logo.png"),
            fit: BoxFit.cover,
            child: Container(), // Empty while loading
          );
        }
      },
    );
  }
}
