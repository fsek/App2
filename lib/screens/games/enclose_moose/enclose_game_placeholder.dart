import "package:flutter/material.dart";
import "helper_widgets/wiggling_widget.dart";
import "helper_widgets/outlined_text.dart";
import "helper_widgets/highlighted_text.dart";

class EncloseMooseGamePlaceholderPage extends StatefulWidget {
  const EncloseMooseGamePlaceholderPage({
    super.key,
    required this.noLevels
  });

  final bool noLevels;

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
    const backgroundImage = "assets/img/enclose_moose/grass/0_idle0.png";

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
              child: Image.asset(
                backgroundImage,
                fit: BoxFit.fill
              )
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
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
                          
                          const SizedBox(  // Counterweight to get the "day" text centered.
                            width: 40,
                            height: 40
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
                    ]
                  )
                ),

                Expanded(
                  child: Center(
                    child: WigglingWidget(
                      controller: _idleController,
                      child: widget.noLevels
                      ? WigglingWidget(
                        controller: _idleController,
                        child: OutlinedText(
                          text: "No levels yet. Check back in later!",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Schoolbell"
                          )
                        )
                      )
                      : CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
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
                                  ),
                                  overlayColor: Colors.black
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                onPressed: null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  visualDensity: VisualDensity.compact
                                ),
                                label: OutlinedText(
                                  text: "Your best: ?",
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
