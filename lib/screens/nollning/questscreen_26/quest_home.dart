import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/questscreen_26/highscore.dart';
import 'package:fsek_mobile/screens/nollning/questscreen_26/quests.dart';

class QuestHomeScreen extends StatefulWidget {
  @override
  _QuestHomeScreenState createState() => _QuestHomeScreenState();
}

class _QuestHomeScreenState extends State<QuestHomeScreen> {
  String rubrik = "assets/data/nollning_26/uppdrag/rubrik1.png";
  Color backgroundColor = Color(0xFF00487B);
  TabController? _controller;

  void _handleTabChange() {
    setState(() {
      rubrik = _controller!.index == 0
          ? "assets/data/nollning_26/uppdrag/rubrik1.png"
          : "assets/data/nollning_26/uppdrag/rubrik2.png";
      backgroundColor = _controller!.index == 0
          ? Color(0xFF00487B)
          : Colors.black;
    });
  }

  @override
  void dispose() {
    _controller?.removeListener(_handleTabChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context);
          if (_controller != controller) {
            _controller?.removeListener(_handleTabChange);
            _controller = controller;
            _controller?.addListener(_handleTabChange);
          }
          return Scaffold(
            body: Container(
              height: screenHeight,
              width: screenWidth,
              child: Stack(
                children: [
                  Positioned.fill(child: ColoredBox(color: backgroundColor)),
                  Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: screenHeight / 8,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: screenHeight * 0.03,
                                  bottom: screenHeight * 0.01,
                                ),
                                child: Image.asset(rubrik, fit: BoxFit.fill),
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () => _controller?.animateTo(0),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () => _controller?.animateTo(1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth,
                        height: screenHeight - (screenHeight / 8),
                        child: TabBarView(
                          children: [
                            QuestScreen(
                              availableHeight:
                                  screenHeight - (screenHeight / 8),
                              availableWidth: screenWidth,
                            ),
                            HighscoreScreen(
                              availableHeight:
                                  screenHeight - (screenHeight / 8),
                              availableWidth: screenWidth,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
