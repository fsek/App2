import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
    String schemaPath = "assets/img/nollning-24/schema/schedulescreen_${t.localeName}.png";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: InteractiveViewer(child: SingleChildScrollView(child: Column(children: [Image.asset(schemaPath, fit: BoxFit.fill)])))
    );
  }
}