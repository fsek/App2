import "package:flutter/material.dart";
import "helper_widgets/wiggling_widget.dart";
import "helper_widgets/outlined_text.dart";
import "helper_widgets/highlighted_text.dart";
import "helper_widgets/animated_thought_bubble.dart";
import "helper_widgets/animated_sprite.dart";
import "asset_handler.dart";
import "enclose_grid_tile.dart";

enum EncloseMoosePlaceholderReason {
  loading,
  noLevels,
  connectionError
}

class EncloseMooseGamePlaceholderPage extends StatefulWidget {
  const EncloseMooseGamePlaceholderPage({
    super.key,
    required this.reason
  });

  final EncloseMoosePlaceholderReason reason;

  @override
  _EncloseMooseGamePlaceholderState createState() => _EncloseMooseGamePlaceholderState();
}

class _EncloseMooseGamePlaceholderState extends State<EncloseMooseGamePlaceholderPage> with TickerProviderStateMixin {
  final _idleDuration = const Duration(milliseconds: 1000);
  late final _idleController = AnimationController(vsync: this)
    ..repeat(
      reverse: false,
      period: _idleDuration
    );

  @override
  void dispose() {
    _idleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: WigglingWidget(
            controller: _idleController,
            child: const BackButton(
              color: Colors.white
            )
          ),

          title: Text.rich(
            TextSpan(
              children: "enclose.moose".characters.map((char) => WidgetSpan(
                child: WigglingWidget(
                  controller: _idleController,
                  child: OutlinedText(
                    text: char,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontFamily: "Schoolbell"
                    )
                  )
                )
              )).toList()
            ),
          )
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              // child: Image.asset(
              //   backgroundImage,
              //   fit: BoxFit.fill
              // )
              child: Container(
                color: Color(0xFF014421)
              )
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WigglingWidget(
                            controller: _idleController,
                            child: IconButton(
                              onPressed: null,
                              icon: const Icon(Icons.calendar_month_rounded),
                              disabledColor: Colors.white
                            )
                          ),

                          Visibility(
                            visible: false,
                            maintainState: true,
                            maintainAnimation: true,
                            maintainSize: true,
                            child: IconButton(
                              onPressed: null,
                              icon: const Icon(Icons.leaderboard_outlined),
                              color: Colors.white
                            )
                          ),

                          const Spacer(),

                          Row(
                            children: [
                              WigglingWidget(
                                controller: _idleController,
                                child: IconButton(
                                  onPressed: null,
                                  icon: const Icon(Icons.chevron_left),
                                  disabledColor: Colors.white
                                )
                              ),

                              WigglingWidget(
                                controller: _idleController,
                                child: OutlinedText(
                                  text: "Day ???",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "Schoolbell"
                                  )
                                )
                              ),

                              WigglingWidget(
                                controller: _idleController,
                                child: IconButton(
                                  onPressed: null,
                                  icon: const Icon(Icons.chevron_right),
                                  disabledColor: Colors.white
                                )
                              ),
                            ]
                          ),

                          Spacer(),

                          WigglingWidget(
                            controller: _idleController,
                            child: IconButton(
                              onPressed: null,
                              icon: const Icon(Icons.restart_alt_outlined),
                              disabledColor: Colors.white
                            )
                          ),

                          WigglingWidget(
                            controller: _idleController,
                              child: IconButton(
                              onPressed: () {
                                showDialog(context: context, builder: _buildHelpDialog());
                              },
                              icon: const Icon(Icons.question_mark_outlined),
                              color: Colors.white
                            )
                          ),
                        ]
                      ),

                      WigglingWidget(
                        controller: _idleController,
                        child: OutlinedText(
                          text: "???",
                          style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontFamily: "Schoolbell"
                          ),
                          textAlign: TextAlign.center,
                        )
                      ),
                    ]
                  )
                ),

                Expanded(
                  child: widget.reason == EncloseMoosePlaceholderReason.loading
                    ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white
                      )
                    )
                    : Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: AnimatedSprite(
                            vsync: this,
                            idleFrames: AssetHandler.getIdleFrames(EncloseGridCellType.moose),
                            idleController: _idleController
                          )
                        ),

                        Center(
                          child: Transform.translate(
                            offset: const Offset(-15, -115),
                            child: SizedBox(
                              width: 200,
                              child: AnimatedThoughtBubble(
                                text: widget.reason == EncloseMoosePlaceholderReason.noLevels
                                  ? "No levels yet. Check back in later.\n\nUntil then, I will roam free!!! (:"
                                  : "There was an error getting the levels. Check back in later.\n\nDo I even exist outside of these levels? );",
                                color: Colors.white.withAlpha(180),
                                idleController: _idleController
                              )
                            )
                          )
                        ),
                      ]
                    ),

                    // child: WigglingWidget(
                    //   controller: _idleController,
                    //   child: widget.noLevels
                    //   ? WigglingWidget(
                    //     controller: _idleController,
                    //     child: OutlinedText(
                    //       text: "No levels yet. Check back in later!",
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 25,
                    //         fontFamily: "Schoolbell"
                    //       )
                    //     )
                    //   )
                    //   : CircularProgressIndicator(
                    //     color: Colors.white,
                    //   ),
                    // ),
                ),

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WigglingWidget(
                              controller: _idleController,
                              child: HighlightedText(
                                child: OutlinedText(
                                  text: "Walls: ?/?",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Schoolbell"
                                  )
                                )
                              )
                            ),

                            Spacer(),

                            Visibility(
                              visible: false,
                              maintainState: true,
                              maintainAnimation: true,
                              maintainSize: true,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )
                                ),
                                onPressed: null,
                                child: const OutlinedText(
                                  text: "Submit",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: "Schoolbell"
                                  )
                                )
                              )
                            ),

                            Spacer(),

                            WigglingWidget(
                              controller: _idleController,
                              child: HighlightedText(
                                child: OutlinedText(
                                  text: "Score: ?",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: "Schoolbell"
                                  )
                                )
                              )
                            ),
                          ]
                        ),

                        Visibility(
                          visible: false,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton.icon(
                                onPressed: null,
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xFF15542D).withAlpha(200),  // Colors.black.withAlpha(55),
                                  visualDensity: VisualDensity.compact
                                ),
                                label: OutlinedText(
                                  text: "Optimal: ?",
                                  style: const TextStyle(
                                    // color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Schoolbell"
                                  )
                                ),
                                icon: const Icon(Icons.star_sharp)
                              ),

                              OutlinedButton.icon(
                                onPressed: null,
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Color(0xFF15542D).withAlpha(200),  // Colors.black.withAlpha(55),
                                  visualDensity: VisualDensity.compact
                                ),
                                label: OutlinedText(
                                  text: "Your solution: ?",
                                  style: const TextStyle(
                                    // color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Schoolbell"
                                  )
                                ),
                                icon: const Icon(Icons.keyboard_return_outlined)
                              ),
                            ]
                          )
                        ),
                      ]
                    )
                  )
                )
              ]
            )
          ]
        )
    );
  }

  Widget Function(BuildContext) _buildHelpDialog() {
    return (context) => const SimpleDialog(
      contentPadding: EdgeInsets.all(16),
      title: Text(
        "How to play",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontFamily: "Schoolbell"
        )
      ),
      children: [
        Text(
          "The objective is to build an enclosure for the moose by placing walls (tapping) on the grid. The moose can not move over the water. The more grass tiles in your enclosure, the higher your score. You only have a limited amount of walls so use them wisely.",
          style: TextStyle( 
            fontSize: 18,
            fontFamily: "Schoolbell"
          )
        ),
      ]
    );
  }
}
