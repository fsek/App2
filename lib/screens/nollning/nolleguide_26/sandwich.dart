import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class SandwichPage extends StatefulWidget {
  @override
  _SandwichPageState createState() => _SandwichPageState();
}

class _SandwichPageState extends State<SandwichPage> {
  static const path = "assets/data/nollning_26/nolleguide/sandwich";

  String? jsonString;

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString("$path/data.json");
    setState(() {
      this.jsonString = jsonString;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!.localeName;
    if (jsonString == null) {
      return Center(child: CircularProgressIndicator());
    }

    final List<dynamic> data = jsonDecode(jsonString!);

    final topBackground = "$path/bg_top_$t.png";
    final endBackground = "$path/bg_end.png";
    final middleBackground = "$path/bg.png";

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: new Color.fromRGBO(236, 112, 38, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(
        panEnabled: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Image.asset(topBackground, fit: BoxFit.fitWidth),
              for (final item in data)
                Stack(
                  children: [
                    Image.asset(middleBackground, fit: BoxFit.fitWidth),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Image.asset(
                          "$path/${item["asset"]}_$t.png",
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center,
                        ),
                        onTap: () => {
                          Navigator.push(
                            context,
                            SandwichOverlayRoute(data: item, locale: t),
                          ),
                        },
                      ),
                    ),
                  ],
                ),
              Image.asset(endBackground, fit: BoxFit.fitWidth),
            ],
          ),
        ),
      ),
    );
  }
}

class SandwichOverlayRoute extends PageRouteBuilder<void> {
  SandwichOverlayRoute({required this.data, required this.locale})
    : super(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withValues(alpha: 0.45),
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) =>
            _SandwichOverlayContent(data: data, locale: locale),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );

  final dynamic data;
  final String locale;
}

class _SandwichOverlayContent extends StatelessWidget {
  const _SandwichOverlayContent({required this.data, required this.locale});

  final dynamic data;
  final String locale;

  static const path = "assets/data/nollning_26/nolleguide/sandwich";
  static const backgroundPath = "$path/bg_sandwich.png";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth;
    final textBoxHeight = screenHeight * 0.62;

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: cardWidth,
          height: textBoxHeight,
          child: InteractiveViewer(
            panEnabled: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: cardWidth,
                height: textBoxHeight,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final textFontSize = constraints.maxWidth * 0.03;
                    final titleFontSize = constraints.maxWidth * 0.05;
                    final priceFontSize = constraints.maxWidth * 0.04;

                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          backgroundPath,
                          width: constraints.maxWidth,
                        ),

                        Positioned(
                          left: constraints.maxWidth * 0.2,
                          right: constraints.maxWidth * 0.2,
                          top: constraints.maxHeight * 0.4,
                          bottom: constraints.maxHeight * 0.2,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  this.data["title"][locale],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: titleFontSize,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Consolas",
                                  ),
                                ),
                                Text(
                                  this.data["price"],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: priceFontSize,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Consolas",
                                  ),
                                ),
                                Text(
                                  this.data["description"][locale],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: textFontSize,
                                    fontFamily: "Consolas",
                                  ),
                                ),
                                if (this.data["additional"] != "")
                                  Image.asset(
                                    "$path/${this.data["additional"]}",
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
