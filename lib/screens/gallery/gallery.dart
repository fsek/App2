import 'package:flutter/material.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/gallery/gallery.dart';
import 'package:fsek_mobile/screens/gallery/album.dart';
import 'package:fsek_mobile/services/album.service.dart';
import 'package:fsek_mobile/services/gallery.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:intl/intl.dart';

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
                items: galleries?[0].years!.map((int year) => DropdownMenuItem(child: Text(year.toString()), value: year)).toList(),
                onChanged: (int? newYear) {
                  setState(() {
                    if (selectedYear != newYear) {
                      selectedYear = newYear!;
                      locator<GalleryService>().getGalleries(year: selectedYear.toString()).then((value) {
                        setState(() {
                          this.galleries = value;
                        });
                      });
                    }
                  });
                },
              )),
              Expanded( //SOMEONE PELASE FIX THIS UGLY ASS SCROLLING !!!!!!. Same goes for the i
              //dividual imagealbums ):::
                child: GridView.count(
                  padding: EdgeInsets.all(12),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: 2,
                  children: generateAlbumThumbnails(),
                ),
              ),
          ])
      //Text(selectedYear.toString())
      );
  }

  List<Widget> generateAlbumThumbnails() {
    if (galleries == null) {
      return [];
    }
    List<Widget> result = [];
    for (Gallery elem in galleries!) {
      result.add(Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top:8), 
            child: Column(
              children: [
                Text(elem.title.toString(), style: Theme.of(context).textTheme.headline6?.apply(color: Colors.white, fontSizeDelta: -4,),
                  softWrap: true,
                  textAlign: TextAlign.center,),
                SizedBox(height: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.date_range, color: Theme.of(context).primaryColor),
                  SizedBox(width: 2,),
                  Text(DateFormat('d MMM yyyy').format(elem.start_date!), style: Theme.of(context).textTheme.bodyText1?.apply(color: Colors.white),)
                ]),
                SizedBox(height: 3,),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.location_pin, color: Theme.of(context).primaryColor), 
                  SizedBox(width: 2,),
                  Flexible(
                    child: Text(elem.location.toString(), style: Theme.of(context).textTheme.bodyText2?.apply(color: Colors.white),
                    overflow: TextOverflow.ellipsis,),
                  ),
                ]),
                SizedBox(height: 3,),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.image, color: Theme.of(context).primaryColor), 
                  SizedBox(width: 2,),
                  Text(elem.image_count.toString(), style: Theme.of(context).textTheme.bodyText2?.apply(color: Colors.white),),
                ]),
              ]),
          ),
          Ink.image(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: NetworkImage("${Environment.API_URL}${elem.thumb.toString()}"),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () => goToAlbum(elem.id!),
            ))
        ])
      );
    }
    return result;
  }

  void goToAlbum(int id) {
    locator<AlbumService>().getAlbum(id).then((album) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumPage(album: album)));
    });

    //Send to correct page and then fetch complete album on other page :^)
  }
}
