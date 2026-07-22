import 'package:flutter/cupertino.dart';

class WallFactory {
  static const path = "assets/data/nollning_26/nolleguide/studentlife/building_blocks";

  static const wallEdge = "$path/wall_edge.png";
  static const wallBackground = "$path/wall_background.png";
  static const background = "$path/background.png";
  static const edgeWidth = 40.0; // Magic number is the width of the pillars.

  static Widget generateWall({
    required List<Widget> children,
    required double screenHeight
  }){
    return SingleChildScrollView(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background),
                  repeat: ImageRepeat.repeat,
                ),
              ),
            ),
          ),

          ConstrainedBox(constraints: BoxConstraints(minHeight: screenHeight),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  width: edgeWidth,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(wallEdge),
                                        repeat: ImageRepeat.repeatY,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(wallBackground),
                                        repeat: ImageRepeat.repeat,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: edgeWidth,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(wallEdge),
                                        repeat: ImageRepeat.repeatY,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 100,
                            left: edgeWidth,
                            right: edgeWidth,
                          ),
                          child: Column(
                              children: children
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}