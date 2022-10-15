
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<String?> easterEggCodeDialog(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    var t = AppLocalizations.of(context)!;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter secret code"),
          content: TextField(
            keyboardType: TextInputType.text,
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "Code here",
            ),
          ),
          actions: [
            TextButton(
              child: Text("Avbryt"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Enter'),
              onPressed: () {
                Navigator.pop(context, _textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }
