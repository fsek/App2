import 'package:flutter/material.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/models/gallery/gallery.dart';
import 'package:fsek_mobile/screens/gallery/album.dart';
import 'package:fsek_mobile/services/gallery.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  List<Gallery>? galleries;
  int selectedYear = DateTime.now().year;
  void initState() {
    locator<GalleryService>().getGalleries().then((value) {
      setState(() {
        this.galleries = value;
        selectedYear = galleries![0].years![0];
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bildgalleri",
          ),
        ),
        body: Column(
            //Make dropdown prettier mayb :
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: DropdownButton(
                    elevation: 2,
                    isExpanded: true,
                    value: selectedYear,
                    items: galleries?[0]
                        .years!
                        .map((int year) => DropdownMenuItem(
                            child: Text(year.toString()), value: year))
                        .toList(),
                    onChanged: (int? newYear) {
                      setState(() {
                        if (selectedYear != newYear) {
                          selectedYear = newYear!;
                          locator<GalleryService>()
                              .getGalleries(year: selectedYear.toString())
                              .then((value) {
                            setState(() {
                              this.galleries = value;
                            });
                          });
                        }
                      });
                    },
                  )),
              Expanded(
                  child: GridView.count(
                padding: EdgeInsets.all(12),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: generateAlbumThumbnails(galleries),
              ))
            ])
        //Text(selectedYear.toString())
        );
  }

  List<Widget> generateAlbumThumbnails(List<Gallery>? galleries) {
    if (galleries == null) {
      return [];
    }
    List<Widget> result = [];
    for (Gallery elem in galleries) {
      result.add(InkWell(
        child: Container(
          child: Image.network("${Environment.API_URL}${elem.thumb.toString()}"),
        ),
        onTap: () => goToAlbum(elem.id!),
      ));
    }
    return result;
  }

  void goToAlbum(int id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumPage(id: id))); 
    //Send to correct page and then fetch complete album on other page :^)
  }
}