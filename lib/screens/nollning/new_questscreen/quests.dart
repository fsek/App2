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


class QuestScreen extends StatefulWidget {
  final double availableWidth;
  final double availableHeight;

  QuestScreen({required this.availableHeight, required this.availableWidth});

  @override
  _QuestScreenState createState() => _QuestScreenState();

}

class _QuestScreenState extends State<QuestScreen> {
  List<AdventureMissionRead>? missions;
  List<GroupMissionRead>? groupmissions;
  UserRead? user;


  void initState() {

  }

  Future<void> _loadInitData() async {
    final user = await ApiService.apiClient.getUsersApi().usersGetMe();
  }

  
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String bakgrund = "assets/data/nollning_25/uppdrag/bakgrund.png";
    String avklarad = "assets/data/nollning_25/uppdrag/bricka-avklarad.png";
    String bedomning = "assets/data/nollning_25/uppdrag/bricka-bedomning.png";
    String misslyckad = "assets/data/nollning_25/uppdrag/bricka-misslyckad.png";
    String start = "assets/data/nollning_25/uppdrag/bricka-start.png";
    String pelare_left = "assets/data/nollning_25/uppdrag/halvpelare_left.png";
    String pelare_right = "assets/data/nollning_25/uppdrag/halvpelare_right.png";
    String rubrik = "assets/data/nollning_25/uppdrag/rubrik.png";

    if(user == null) {
      return Scaffold(
        body: CircularProgressIndicator(),
      );
    }

    return DefaultTabController(
      length: 5, 
      child: Column(

      )
    );
  }


  Widget createMissionCard(GroupMissionRead groupmission) {
    return SizedBox();
  }

}