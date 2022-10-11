
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<String?> easterEggCodeDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _textFieldController = TextEditingController();
    var t = AppLocalizations.of(context)!;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter secret crazy code"),
          content: TextField(
            keyboardType: TextInputType.text,
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "Up down down up right left",
            ),
          ),
          actions: [
            TextButton(
              child: Text("No I want mummy"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Bring it on!'),
              onPressed: () {
                if (_isValidInput(_textFieldController.text)) {
                  Navigator.pop(context, _textFieldController.text);
                }
              },
            ),
          ],
        );
      },
    );
  }

  bool _isValidInput(String value) {
    return false;
  }