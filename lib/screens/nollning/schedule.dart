import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';


class ScheduleScreenPage extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}


class _ScheduleScreenState extends State<ScheduleScreenPage> {
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var t =  AppLocalizations.of(context)!;
    String schemaPath = "assets/data/nollning_25/schema/schedulescreen_${t.localeName}.png";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(panEnabled: true, child: SingleChildScrollView(child: Column(children: [Image.asset(schemaPath, fit: BoxFit.fill)])))
    );
  }
}