import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class PlaceInfo {
  final String title;
  final String description_en;
  final String description_sv;
  final int top;
  final int left;
  final String asset;
  final String? extraAsset;

  PlaceInfo({
    required this.title,
    required this.description_en,
    required this.description_sv,
    required this.top,
    required this.left,
    required this.asset,
    required this.extraAsset,
  });

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
      title: json['title'],
      description_en: json['description']['en'],
      description_sv: json['description']['sv'],
      top: json['top'],
      left: json['left'],
      asset: json['asset'],
      extraAsset: json['extraAsset'],
    );
  }
}

Future<List<PlaceInfo>> loadJson() async {
  String jsonString = await rootBundle.loadString('assets/data/nollning-24/map_info.json');
  final jsonResponse = json.decode(jsonString);

  return (jsonResponse as List).map((place) => PlaceInfo.fromJson(place)).toList();
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  String baseAssetPath = "assets/img/nollning-24/karta/";
  final String imagePath = "assets/img/nollning-24/karta/mapscreen.png";
  final String backgroundPath = "assets/img/nollning-24/hemsidan/homescreen_week_2.png";
  final double pinWidth = 17.0;
  final double pinHeight = 17.0;
  final int imageWidth = 2900;
  final int imageHeight = 2480;

  List? pins;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight); // Remove height of AppBar
    double bodyWidth = MediaQuery.of(context).size.width;

    _placePins(context, bodyHeight, bodyWidth).then((value) {
      pins = value;
      setState(() {});
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD APPBAR TITLE OR REMOVE!!"),
      ),
      body: Container(
        child: PhotoView.customChild(
          initialScale: 2.0,
          backgroundDecoration: BoxDecoration(image: DecorationImage(image: AssetImage(backgroundPath))),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(imagePath), // Your map image
              ...?pins,
              // Positioned(
              //   top: bodyHeight / 5,
              //   left: bodyWidth / 2.1,
              //   child: GestureDetector(
              //     onTap: () => _showPOIDialog(context, 'Ekologihuset', 'detta e ekologihuset', null),
              //     child: Image.asset(
              //       baseAssetPath + "AF.png",
              //       width: pinWidth,
              //       height: pinHeight,
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: bodyHeight * 0.5 + (0.778 - 0.5) * bodyWidth * 2480 / 2900 - pinHeight / 2,
              //   left: bodyWidth * 0.303 - pinWidth / 2,
              //   child: GestureDetector(
              //     onTap: () => _showPOIDialog(context, 'Mattehuset', 'mh vet alla va de e', ""),
              //     child: Image.asset(
              //       housePin,
              //       width: 20,
              //       height: 20,
              //     ),
              //   ),
              // ),
              // Add more POIs as needed
            ],
          ),
          minScale: 0.5,
          maxScale: 6.0,
        ),
      ),
    );
  }

  Future<List<Positioned>> _placePins(BuildContext context, double bodyHeight, double bodyWidth) async {
    List<PlaceInfo> placeInfos = await loadJson();
    String locale = Localizations.localeOf(context).toString();
    var pinList = placeInfos
        .map((data) => Positioned(
              top: bodyHeight / 2 + (data.top - 0.5 * imageHeight) * bodyWidth / imageWidth - pinHeight / 2,
              left: bodyWidth * data.left / imageWidth - pinWidth / 2,
              // top: bodyHeight / 5,
              // left: bodyWidth / 2,
              child: GestureDetector(
                onTap: () => _showPOIDialog(
                  context,
                  data.title,
                  (locale == "sv") ? data.description_sv : data.description_en,
                  data.extraAsset,
                ),
                child: Image.asset(
                  baseAssetPath + data.asset,
                  height: pinHeight,
                  width: pinWidth,
                ),
              ),
            ))
        .toList();
    return pinList;
  }

  void _showPOIDialog(BuildContext context, String title, String description, String? extraAsset) {
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
              (extraAsset != null) ? Image.asset(baseAssetPath + extraAsset) : SizedBox.shrink(),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xff630b0b)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'ADD CLOSE TEXT',
                style: TextStyle(fontFamily: 'Testament'),
              ),
            ),
          ],
        );
      },
    );
  }
}
