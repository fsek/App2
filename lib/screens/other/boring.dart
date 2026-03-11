import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/util/boring_cryptography.dart';

class BoringPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BoringPageState();
}

class _BoringPageState extends State<BoringPage> {
  bool buttonPressed = false;
  bool correctAnswer = false;


  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var currentTime = DateTime.now();
    var currentDay = DateTime(currentTime.year, currentTime.month, currentTime.day);
    var boringDay = DateTime(2026, 3, 6);
    if(currentDay == boringDay) {
      return Scaffold(
        appBar: AppBar(
          title: Text("På spåret!")
        ),
          body: Container(child: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(child:
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () => _handleEmergencyPress(),
                      icon: Image(image: AssetImage("assets/img/memes/luuk.png"), width: 500)),
                  visible: !buttonPressed),
                  Visibility(child: Text("Rätt svar!", style: TextStyle(fontSize: 48, color: Colors.black),), visible: buttonPressed && correctAnswer),
                  Visibility(child: Text("Fel svar!", style: TextStyle(fontSize: 48, color: Colors.black),), visible: buttonPressed && !correctAnswer,)
                ],
              )), color: buttonPressed ? (correctAnswer ? Colors.lightGreenAccent : Colors.redAccent) : Theme.of(context).colorScheme.surface,)
      );
    }
    else{
      return Scaffold(
          appBar: AppBar(
            title: Text(""),
          ),
          body: Text("Very boring page!"));
    }
  }

  void _handleEmergencyPress() async {
    AudioPlayer().play(AssetSource("audio/boringsound.mp3"));
    String? answer = await emergencyStopDialog(context);
    if(answer == null) {
      answer = "";
    }

    var encryptedAnswer = BoringCryptography.encrypt(answer.toLowerCase());
    if(encryptedAnswer.contains("gvzr") && (encryptedAnswer.contains("snynsry") || encryptedAnswer.contains("xrono"))){
       setState(() {
          correctAnswer = true;
        });
      }
    setState(() {
      buttonPressed = true;
    });
    }
}


Future<String?> emergencyStopDialog(BuildContext context) {
  TextEditingController _textFieldController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Vart är vi på väg?"),
        content: TextField(
          keyboardType: TextInputType.text,
          controller: _textFieldController,
          decoration: InputDecoration(
            hintText: "Plats",
          ),
        ),
        actions: [
          TextButton(
            child: Text('Svara'),
            onPressed: () {
              Navigator.pop(context, _textFieldController.text);
            },
          ),
        ],
      );
    },
  );
}
