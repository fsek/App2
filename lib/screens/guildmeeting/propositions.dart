import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropositionsPage extends StatefulWidget {
  _PropositionsPageState createState() => _PropositionsPageState();
}

class _PropositionsPageState extends State<PropositionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(appBar: AppBar(title: "titw"));
  }
}
