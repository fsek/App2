import "package:flutter/material.dart";
import "moose_game/moose_game.dart";
import "enclose_moose/enclose_moose.dart";

class GameChooserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EncloseMoosePage())
              );
            },
            child: const Text("Enclose!")
          ),

          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MooseGamePage())
              );
            },
            child: const Text("Moose game!")
          ),
        ]
      )
    );
  }
}
