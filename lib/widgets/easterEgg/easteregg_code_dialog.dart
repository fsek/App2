import 'package:flutter/material.dart';

Future<String?> easterEggCodeDialog(BuildContext context) {
  TextEditingController _textFieldController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Enter secret code"),
        content: TextField(
          keyboardType: TextInputType.text,
          controller: _textFieldController,
          decoration: InputDecoration(
            hintText: "Secret",
          ),
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
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
