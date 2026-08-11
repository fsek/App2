import "package:flutter/material.dart";
import "moose_game/moose_game.dart";
import "enclose_moose/enclose_moose.dart";
import "enclose_moose/helper_widgets/wiggling_widget.dart";
import "enclose_moose/helper_widgets/outlined_text.dart";

class GameChooserPage extends StatefulWidget {
  @override
  _GameChooserState createState() => _GameChooserState();
}

class _GameChooserState extends State<GameChooserPage> with SingleTickerProviderStateMixin {
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
      body: Column(
        children: [
          Expanded(
            child: _filteredImage(
              "assets/img/enclose_moose/logo.png",
              extraChild: Center(
                child: WigglingWidget(
                  controller: _idleController,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => EncloseMoosePage())
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: "enclose.moose".characters.map((char) => WidgetSpan(
                          child: WigglingWidget(
                            controller: _idleController,
                            maxTranslate: const Offset(1, 0.5),
                            child: OutlinedText(
                              text: char,
                              style: const TextStyle(
                                fontSize: 30,
                                fontFamily: "Schoolbell"
                              )
                            )
                          )
                        )).toList()
                      )
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black.withAlpha(128),
                      visualDensity: VisualDensity.compact
                    )
                    // child: Text("Enclose.moose")
                  )
                )
              )
            )
          ),

          Container(
            height: 1,
            color: Theme.of(context).primaryColor
          ),

          Expanded(
            child: _filteredImage(
              "assets/img/moose_game/logo.png",
              extraChild: Center(
                child: TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MooseGamePage())
                  ),
                  child: Text(
                    "Moose Game",
                    style: TextStyle(
                      fontFamily: "NF-Pixels",
                      fontSize: 30
                    )
                  )
                )
              )
            )
          ),
        ]
      )
    );
  }

  Widget _filteredImage(String imagePath, {Widget? extraChild, int filterAlpha = 128}) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover
          )
        ),

        Container(
          color: Colors.black.withAlpha(filterAlpha)
        ),

        if (extraChild != null)
          extraChild
      ]
    );
  }
}
