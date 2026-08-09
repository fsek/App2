import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class PlaceInfo {
  final String title;
  final String description_en;
  final String description_sv;
  final List<String>? descriptionAssets;
  final Rect box;
  // final String asset;

  PlaceInfo({
    required this.title,
    required this.description_en,
    required this.description_sv,
    this.descriptionAssets,
    required this.box,
    // required this.asset,
  });

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
      title: json['title'],
      description_en: json['description']['en'],
      description_sv: json['description']['sv'],
      descriptionAssets: List<String>.from(json["descriptionAssets"]),
      box: Rect.fromLTRB(
        json["box"]["left"], json["box"]["top"], json["box"]["right"], json["box"]["bottom"]
      ),
      // asset: json['asset'],
    );
  }
}

Future<List<PlaceInfo>> loadJson() async {
  String jsonString = await rootBundle.loadString(
    'assets/data/nollning_26/map/map_info.json');
  final jsonResponse = json.decode(jsonString);

  return (jsonResponse as List)
      .map((place) => PlaceInfo.fromJson(place))
      .toList();
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final String imagePath = "assets/data/nollning_25/karta.png";
  final int imageWidth = 3000;
  final int imageHeight = 4218;

  List? pins;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _placePins(context).then((value) {
      pins = value;
      setState(() {});
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.introductionMap),
      ),
      body: Container(
        child: PhotoView.customChild(
          initialScale: 2.0,
          backgroundDecoration: BoxDecoration(color: Color(0xff2c2724)),
          child: SizedBox(
            width: imageWidth.toDouble(),
            height: imageHeight.toDouble(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(imagePath),
                ...?pins,
              ],
            ),
          ),
          minScale: 1.0,
          maxScale: 6.0,
        )
      ),
    );
  }

  Future<List<Positioned>> _placePins(
      BuildContext context) async {
    List<PlaceInfo> placeInfos = await loadJson();
    String locale = Localizations.localeOf(context).toString();

    final bodyHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            kToolbarHeight); // Remove height of AppBar
    final bodyWidth = MediaQuery.of(context).size.width;

    final imgAspectRatio = imageWidth / imageHeight;
    final displayHeight = bodyWidth / imgAspectRatio;
    final yOffset = (bodyHeight - displayHeight) / 2;

    var pinList = placeInfos
        .map((data) => 
            Positioned.fromRect(
              rect: data.box.scale(bodyWidth, displayHeight).translate(0, yOffset),
              child: GestureDetector(
                onTap: () => _showPOIDialog(
                  context,
                  data.title,
                  (locale == "sv") ? data.description_sv : data.description_en,
                  data.descriptionAssets,
                ),
                child: Stack(
                  children: [
                    // Image.asset(
                    //   data.asset,
                    //   height: pinHeight,
                    //   width: pinWidth,
                    // ),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          border: BoxBorder.all(color: Colors.red),
                          // boxShadow: [
                          //   BoxShadow(
                          //     blurRadius: 5,
                          //     spreadRadius: 0,
                          //     blurStyle: BlurStyle.outer
                          //   )
                          // ]
                        ),
                      )
                    )
                  ]
                )
              ),
            ))
        .toList();
    return pinList;
  }

  void _showPOIDialog(BuildContext context, String title, String description,
      List<String>? descriptionAssets) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xffdcc394),
          title: Text(
            title,
            style: TextStyle(fontFamily: 'Testament'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                description,
                style: TextStyle(fontFamily: 'Testament'),
              ),

              Image.asset(descriptionAssets![0], fit: BoxFit.contain,),

              Image.asset(descriptionAssets[1], fit: BoxFit.contain,),

              // FittedBox(
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Image.asset(descriptionAssets![0], fit: BoxFit.contain,),
              //       Spacer(),
              //       Image.asset(descriptionAssets[1], fit: BoxFit.contain,)
              //     ],
              //   )
              // )
              
              // if (descriptionAssets != null)
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: descriptionAssets!.map((asset) => Image.asset(asset, fit: BoxFit.contain,)).toList()
                // ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xff630b0b)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context)!.introductionMapClose,
                style: TextStyle(fontFamily: 'Testament'),
              ),
            ),
          ],
        );
      },
    );
  }
}

extension RectScaling on Rect {  // Where should this be?
  Rect scale(double scaleX, double scaleY) {
    return Rect.fromLTRB(
      left * scaleX,
      top * scaleY,
      right * scaleX,
      bottom * scaleY
    );
  }
}
