import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MannersPage extends StatefulWidget {
  @override
  _MannersPageState createState() => _MannersPageState();
}

class _MannersPageState extends State<MannersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vett & Etikett"),
      ),
    );
  }
}
