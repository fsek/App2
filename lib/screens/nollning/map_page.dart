import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class PlaceInfo {
  final String titleSv;
  final String titleEn;
  final String descriptionSv;
  final String descriptionEn;
  final List<String> descriptionAssets;
  final List<Rect> boxes;
  // final String asset;

  const PlaceInfo({
    required this.titleSv,
    required this.titleEn,
    required this.descriptionSv,
    required this.descriptionEn,
    required this.descriptionAssets,
    required this.boxes,
    // required this.asset,
  });

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
      titleSv: json["title"]["sv"],
      titleEn: json["title"]["en"],
      descriptionSv: json["description"]["sv"],
      descriptionEn: json["description"]["en"],
      descriptionAssets: List<String>.from(json["descriptionAssets"]),
      boxes: (json["boxes"] as List<dynamic>).map((box) => Rect.fromLTWH(
        box["left"], box["top"], box["width"], box["height"]
      )).toList(),
      // asset: json["asset"],
    );
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final _imagePath = "assets/data/nollning_26/map/map.png";
  final _imageWidth = 3050;
  final _imageHeight = 4062;

  double get _bodyHeight => MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight); // Remove height of AppBar
  double get _bodyWidth => MediaQuery.of(context).size.width;
  double get _displayHeight => _bodyWidth * _imageHeight / _imageWidth;

  final _transformationController = TransformationController();

  List<Widget>? pins;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _applyInitialZoom();
    _placePins(context);
  }

  @override
  void dispose() {
    _transformationController.dispose();

    super.dispose();
  }

  void _applyInitialZoom() {
    final zoomFactor = _bodyHeight / _displayHeight;

    _transformationController.value.setEntry(0, 0, zoomFactor);
    _transformationController.value.setEntry(1, 1, zoomFactor);
    _transformationController.value.setEntry(2, 2, zoomFactor);

    final xOffset = _bodyWidth * (1 - zoomFactor) / 2;
    final yOffset = _bodyHeight * (1 - zoomFactor) / 2;
    _transformationController.value.setEntry(0, 3, xOffset);
    _transformationController.value.setEntry(1, 3, yOffset);
  }

  Future<Iterable<PlaceInfo>> loadJson() async {
    const mapInfoPath = "assets/data/nollning_26/map/map_info.json";
    final jsonString = await rootBundle.loadString(mapInfoPath);
    final jsonResponse = json.decode(jsonString);

    return (jsonResponse as List)
        .map((place) => PlaceInfo.fromJson(place));
  }

  Future<void> _placePins(BuildContext context) async {
    final placeInfos = await loadJson();
    for (final placeInfo in placeInfos) {
      for (final asset in placeInfo.descriptionAssets) {
        precacheImage(AssetImage(asset), context);
      }
    }

    final locale = Localizations.localeOf(context).toString();

    final scale = _bodyWidth / _imageWidth;
    final yOffset = (_bodyHeight - _displayHeight) / 2;

    List<Widget> pinList = [];
    for (final placeInfo in placeInfos) {
      for (final box in placeInfo.boxes) {
        pinList.add(Positioned.fromRect(
          rect: Rect.fromLTWH(box.left * scale, box.top * scale, box.width * scale, box.height * scale).translate(0, yOffset),  // boxes are in (image-)absolute coordinates
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => showDialog(
              context: context,
              builder: _buildPOIDialog(
                locale == "sv" ? placeInfo.titleSv : placeInfo.titleEn,
                locale == "sv" ? placeInfo.descriptionSv : placeInfo.descriptionEn,
                placeInfo.descriptionAssets,
              )
            ),
            child: Container(
              color: Colors.transparent
              // decoration: BoxDecoration(
              //   color: Colors.red.withAlpha(128),
              //   border: Border.all(color: Colors.red),
              // )
            )
          ),
        ));
      }
    }

    setState(() {
      pins = pinList;
    });
  }

  Widget Function(BuildContext) _buildPOIDialog(String title, String description,
      List<String>? descriptionAssets) {
    return (BuildContext context) => AlertDialog(
      // constraints: BoxConstraints(
      //   minWidth: MediaQuery.of(context).size.width
      // ),
      backgroundColor: const Color(0xFFFF00FF),
      contentPadding: const EdgeInsets.all(20),
      content: Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      // fit: BoxFit.contain,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "NF-Pixels",
                          fontSize: 30
                        )
                      )
                    )
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.white
                  )
                ]
              ),

              if (descriptionAssets != null)
                ...descriptionAssets.map((asset) => InteractiveViewer(
                  minScale: 1,
                  maxScale: 5,
                  child: Image.asset(
                    asset,
                    fit: BoxFit.contain
                  )
                )),

              Text(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "NF-Pixels",
                  fontSize: 20
                ),
              )
            ]
          )
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.introductionMap),
      ),
      // body: PhotoView.customChild(
      //   backgroundDecoration: BoxDecoration(color: Color(0xff2c2724)),
      //   childSize: Size(
      //     _imageWidth.toDouble(),
      //     _imageHeight.toDouble(),
      //   ),
      //   initialScale: PhotoViewComputedScale.covered,
      //   // minScale: PhotoViewComputedScale.contained,
      //   // maxScale: PhotoViewComputedScale.covered * 6,
      //   gestureDetectorBehavior: HitTestBehavior.translucent,
      //   child: SizedBox(  // Probably not neded but
      //     width: _imageWidth.toDouble(),
      //     height: _imageHeight.toDouble(),
      //     child: Stack(
      //       alignment: Alignment.center,
      //       children: [
      //         Image.asset(_imagePath),
      //         ...?pins,
      //       ],
      //     )
      //   )
      // )

      body: Container(
        color: const Color(0xff2c2724),
        child: InteractiveViewer(
          transformationController: _transformationController,
          minScale: 1.0,
          maxScale: 6.0,
          child: SizedBox(
            width: _imageWidth.toDouble(),
            height: _imageHeight.toDouble(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(_imagePath),

                ...?pins,
              ]
            )
          )
        )
      )
    );
  }
}
