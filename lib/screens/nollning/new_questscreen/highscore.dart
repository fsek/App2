import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/highscore_tab_new.dart';
import 'package:fsek_mobile/screens/nollning/questscreen/quests.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fsek_mobile/models/home/calendarevent.dart';
import 'package:fsek_mobile/services/event.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/screens/event/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HighscoreScreen extends StatefulWidget {
  @override
  _HighscoreScreenState createState() => _HighscoreScreenState();
}

class _HighscoreScreenState extends State<HighscoreScreen> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1, 
      child: Text("")
    );
  }

}