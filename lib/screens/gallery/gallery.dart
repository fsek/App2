import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/gallery/gallery.dart';
import 'package:fsek_mobile/screens/gallery/album.dart';
import 'package:fsek_mobile/services/album.service.dart';
import 'package:fsek_mobile/services/gallery.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<AlbumRead>? galleries;
  int selectedYear = DateTime.now().year;
  void initState() {
    ApiClient().getAlbumsApi().albumsGetAlbums().then((value) {
      setState(() {
        this.galleries = value.data!.toList().where((item) => item.year == selectedYear).toList();
        // selectedYear = galleries![0].year;
      });
    });
    super.initState();
  }


  Widget build(BuildContext context) {
      var t = AppLocalizations.of(context)!;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            t.galleryTitle,
          ),
        ),
        body: Column(
          children: [
              Container(
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: DropdownButton(
                    iconDisabledColor: Theme.of(context).colorScheme.surface,
                    iconEnabledColor: Theme.of(context).colorScheme.surface,
                    dropdownColor: Theme.of(context).colorScheme.surface,
                    elevation: 2,
                    isExpanded: true,
                    value: selectedYear,
                    items: galleries!.map((item) => item.year).toList().map((year) => DropdownMenuItem(
                      child: Text(
                        year.toString(), style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary)),
                              value: year)).toList(),
                      onChanged: (int? newYear) {
                        setState(() {
                          if (selectedYear != newYear) {
                            selectedYear = newYear!;
                            ApiClient().getAlbumsApi().albumsGetAlbums().then((value) {
                              setState(() {
                                this.galleries = value.data!.toList().where((item) => item.year == selectedYear).toList();
                              });
                            });
                          }
                      });
                    }
                  )
                ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(12),
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: generateAlbumThumbnails(),
                  shrinkWrap: true,

                
                )
              ) 
                        
        ]),
      );


  }

  // Widget build(BuildContext context) {
  //   var t = AppLocalizations.of(context)!;
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Text(
  //           t.galleryTitle,
  //         ),
  //       ),
  //       body: Column(
  //           //Make dropdown prettier mayb :
  //           children: [
  //             Container(
  //                 decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
  //                 padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
  //                 child: DropdownButton(
  //                   iconDisabledColor: Theme.of(context).colorScheme.onBackground,
  //                   iconEnabledColor: Theme.of(context).colorScheme.onBackground,
  //                   dropdownColor: Theme.of(context).colorScheme.background,
  //                   elevation: 2,
  //                   isExpanded: true,
  //                   value: selectedYear,
  //                   items: galleries?[0]
  //                       .years!
  //                       .map((int year) => DropdownMenuItem(
  //                           child: Text(year.toString(), style: Theme.of(context).textTheme.labelLarge!.copyWith(
  //                             color: Theme.of(context).colorScheme.onPrimary,
  //                           )), value: year))
  //                       .toList(),
  //                   onChanged: (int? newYear) {
  //                     setState(() {
  //                       if (selectedYear != newYear) {
  //                         selectedYear = newYear!;
  //                         locator<GalleryService>()
  //                             .getGalleries(year: selectedYear.toString())
  //                             .then((value) {
  //                           setState(() {
  //                             this.galleries = value;
  //                           });
  //                         });
  //                       }
  //                     });
  //                   },
  //                 )),
  //             Expanded(
  //               child: GridView.count(
  //                 padding: EdgeInsets.all(12),
  //                 crossAxisSpacing: 5,
  //                 mainAxisSpacing: 5,
  //                 crossAxisCount: 2,
  //                 children: generateAlbumThumbnails(),
  //                 shrinkWrap: true,
  //               ),
  //             ),
  //           ])
  //       //Text(selectedYear.toString())
  //       );
  // }

  List<Widget> generateAlbumThumbnails() {
    if (galleries == null) {
      return [];
    }
    List<Widget> result = [];
    for (AlbumRead elem in galleries!) {
      result.add(Stack(children: [
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Column(children: [
            Text(
              elem.name.toString(),
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
                      DateFormat('d MMM yyyy').format(DateTime.now()), // TODO change till to the actual date after its been added to the model
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
                        "Intigheten",                         //elem.location.toString(), TODO change this after its been added to the album model
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
                    Icon(Icons.image, color: Theme.of(context).colorScheme.primary),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      elem.imgs.length.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.apply(color: Colors.white),
                    ),
                  ]),
                ],
              ),
            )
          ]),
        ),
        Ink.image(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: getPicture(elem.imgs.first),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () => goToAlbum(elem.id!),
            ))
      ]));
    }
    return result;
  }

  void goToAlbum(int id) {
    locator<AlbumService>().getAlbum(id).then((album) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AlbumPage(album: album)));
    });

    //Send to correct page and then fetch complete album on other page :^)
  }

  // IDK if this shit even works
  ImageProvider<Object> getPicture(ImgInAlbum elem) {
    ImageProvider<Object> imageProv =
        AssetImage("assets/img/f_logo.png"); //default

    Uint8List decodedString = Uint8List(0);
    
    ApiClient().getImgApi().imgGetImage(id: elem.id).then((value) {
      if(value.data != null){
         decodedString = base64Decode(value.data!.asString);
      }
    }
    );

    if (decodedString.length != 0) {
      return MemoryImage(decodedString);
    }
    return imageProv;
    





    // final dio = Dio();
    // final response = dio.get(
    //   'http://10.0.2.2/8000/img/${elem.id}',
    //   options: Options(responseType: ResponseType.bytes),
    // ).then((value) {
    //   if (value.statusCode == 200 && value.data != null) {
    //   return MemoryImage(Uint8List.fromList(value.data!));
    // } 
    // });

   

    // final response  = await ApiClient().getImgApi().imgGetImage(id: elem.id);

    // if (response.data != null){
    //   final rawResponse = response.response;
    //   final bytes = Uint8List.fromList(response.data!)
    //   return MemoryImage(bytes)
    // }
  }
}
