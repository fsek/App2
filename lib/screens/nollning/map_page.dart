import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class PlaceInfo {
  final String title_sv;
  final String title_en;
  final String description_en;
  final String description_sv;
  final List<String> descriptionAssets;
  final List<Rect> boxes;
  // final String asset;

  const PlaceInfo({
    required this.title_sv,
    required this.title_en,
    required this.description_en,
    required this.description_sv,
    required this.descriptionAssets,
    required this.boxes,
    // required this.asset,
  });

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
      title_sv: json["title"]["sv"],
      title_en: json["title"]["en"],
      description_en: json["description"]["en"],
      description_sv: json["description"]["sv"],
      descriptionAssets: List<String>.from(json["descriptionAssets"]),
      boxes: (json["boxes"] as List<dynamic>).map((box) => Rect.fromLTWH(
        box["left"], box["top"], box["width"], box["height"]
      )).toList(),
      // asset: json["asset"],
    );
  }
}

Future<List<PlaceInfo>> loadJson() async {
  String jsonString = await rootBundle.loadString("assets/data/nollning_26/map/map_info.json");
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
  final String _imagePath = "assets/data/nollning_26/map/map.png";
  final int _imageWidth = 3050;
  final int _imageHeight = 4062;

  double get _bodyHeight => MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight); // Remove height of AppBar
  double get _bodyWidth => MediaQuery.of(context).size.width;
  double get displayHeight => _bodyWidth * _imageHeight / _imageWidth;

  final TransformationController _transformationController = TransformationController();

  List<Widget>? pins;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _applyInitialZoom();
    _placePins(context);
  }

  void _applyInitialZoom() {
    final zoomFactor = _bodyHeight / displayHeight;

    _transformationController.value.setEntry(0, 0, zoomFactor);
    _transformationController.value.setEntry(1, 1, zoomFactor);
    _transformationController.value.setEntry(2, 2, zoomFactor);

    final xOffset = _bodyWidth * (1 - zoomFactor) / 2;
    final yOffset = _bodyHeight * (1 - zoomFactor) / 2;
    _transformationController.value.setEntry(0, 3, xOffset);
    _transformationController.value.setEntry(1, 3, yOffset);
  }

  Future<void> _placePins(BuildContext context) async {
    List<PlaceInfo> placeInfos = await loadJson();
    for (final placeInfo in placeInfos) {
      for (final asset in placeInfo.descriptionAssets) {
        precacheImage(AssetImage(asset), context);
      }
    }

    String locale = Localizations.localeOf(context).toString();

    final yOffset = (_bodyHeight - displayHeight) / 2;

    List<Widget> pinList = [];
    for (final placeInfo in placeInfos) {
      for (final box in placeInfo.boxes) {
        pinList.add(Positioned.fromRect(
          rect: box.scale(_bodyWidth / _imageWidth, displayHeight / _imageHeight).translate(0, yOffset),  // boxes are in (image-)absolute coordinates
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => showDialog(
              context: context,
              builder: _buildPOIDialog(
                locale == "sv" ? placeInfo.title_sv : placeInfo.title_en,
                locale == "sv" ? placeInfo.description_sv : placeInfo.description_en,
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

    // var pinList = placeInfos.map((data) => Positioned.fromRect(
    //   rect: data.box,
    //   child: GestureDetector(
    //     onTap: () => _showPOIDialog(
    //       context,
    //       data.title,
    //       (locale == "sv") ? data.description_sv : data.description_en,
    //       data.descriptionAssets,
    //     ),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: Colors.red.withAlpha(128),
    //         border: BoxBorder.all(color: Colors.red),
    //       ),
    //     )
    //   ),
    // )).toList();

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

extension RectScaling on Rect {  // Where should this be?
  Rect scale(num scaleX, num scaleY) {
    return Rect.fromLTRB(
      left * scaleX,
      top * scaleY,
      right * scaleX,
      bottom * scaleY
    );
  }
}
