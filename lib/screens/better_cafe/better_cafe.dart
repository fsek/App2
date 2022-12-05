import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class BetterCafePage extends StatefulWidget {
//   @override
//   _BetterCafePageState createState() => _BetterCafePageState();
// }

// class _BetterCafePageState extends State<BetterCafePage> {
//   @override
//   Widget build(BuildContext context) {
//     String locale = Localizations.localeOf(context).toString();
//     return Scaffold(
//         appBar: AppBar(
//       title: Text(locale),
//     ));
//   }
// }

class BetterCafePage extends StatefulWidget {
  BetterCafePage({Key? key}) : super(key: key);

  @override
  _BetterCafePageState createState() => _BetterCafePageState();
}

class _BetterCafePageState extends State<BetterCafePage> {
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).toString();
    return Scaffold(
        appBar: AppBar(
          title: Text(locale),
        ),
        body: Container(
          child: Text("Mackmeny"),
        ));
  }
}
