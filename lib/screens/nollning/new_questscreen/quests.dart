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

class _QuestScreenState extends State<QuestScreen> with SingleTickerProviderStateMixin{
  Map<int, List<AdventureMissionRead>> missionsMap = {};
  Map<int, List<GroupMissionRead>> groupMissionsMap = {};
  AdminUserRead? user;
  NollningRead? nollning;
  NollningGroupRead? nollningGroup;
  dynamic selectedMission;
  late TabController _tabController;

  String bakgrund = "assets/data/nollning_25/uppdrag/bakgrund.png";
  String avklarad = "assets/data/nollning_25/uppdrag/bricka-avklarad.png";
  String bedomning = "assets/data/nollning_25/uppdrag/bricka-bedomning.png";
  String misslyckad = "assets/data/nollning_25/uppdrag/bricka-misslyckad.png";
  String start = "assets/data/nollning_25/uppdrag/bricka-start.png";
  String pelare_left = "assets/data/nollning_25/uppdrag/halvpelare_left.png";
  String pelare_right = "assets/data/nollning_25/uppdrag/halvpelare_right.png";
  String rubrik = "assets/data/nollning_25/uppdrag/rubrik.png";

  @override
  void initState() {
    super.initState();

    this._tabController = TabController(
      length: 5, vsync: this);

    _loadInitData();

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }  

  Future<void> _loadInitData() async {
    final user = await ApiService.apiClient.getUsersApi().usersGetMe();
    final userData = user.data;
    final nollning = await ApiService.apiClient.getNollningApi().nollningGetNollningByYear(year: DateTime.now().year);
    final nollningData = nollning.data;
    List<AdventureMissionRead>? missionList;
    NollningGroupRead? nollningGroupData;
    List<GroupMissionRead>? groupMissionList;

    if(nollningData != null && userData != null){
      final missions = await ApiService.apiClient.getNollningApi().nollningGetAllAdventureMissionsInNollning(nollningId: nollningData.id);
      if(missions.data != null) {
        missionList = missions.data!.toList();
      }
      final nollningGroupData = await findUserNollningGroup(nollningData, userData.id);
      if(nollningGroupData != null) {
        final groupmissions = await ApiService.apiClient.getNollningApi().nollningGetGroupMissionsFromNollningGroup(nollningGroupId: nollningGroupData.id);
        groupmissions.data != null ? groupMissionList = groupmissions.data?.toList() : ();
      }
    }
    setState(() {
      this.user = userData;
      this.nollning = nollningData;
      this.nollningGroup = nollningGroupData;
      missionList != null ? missionList.forEach((mission) {
        this.missionsMap.putIfAbsent(mission.nollningWeek, () => []).add(mission); 
      }) : ();
      groupMissionList != null ? groupMissionList.forEach((groupmission) {
        this.groupMissionsMap.putIfAbsent(groupmission.adventureMission.nollningWeek, () => []).add(groupmission);
      }) : ();
    });
    
  }

  NollningGroupRead? findUserNollningGroup(NollningRead nollning, int userId) {
    try { 
      final nollningGroup = nollning.nollningGroups.firstWhere((nollningGroup) => (
        nollningGroup.group.groupUsers.any((groupUser) => groupUser.user.id == userId)
      ));
      return nollningGroup;
    } catch (e) {
      return null;
    }

  }

  
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    if(user == null || nollning == null) {
      return Scaffold(
        body: Container(
          height: widget.availableHeight,
          width: widget.availableWidth,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(bakgrund, fit: BoxFit.fill,)),
              Center(child: CircularProgressIndicator()),
            ],
          ),
        )
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: widget.availableWidth,
            height: widget.availableHeight/20,
            child: Stack(
              children: [
                Positioned.fill(child: Image.asset(bakgrund, fit: BoxFit.fill,)),
                Container(
                  // height: widget.availableHeight,
                  width: widget.availableWidth - 40,
                  child: TabBar(
                    onTap: (index) {
                      if(selectedMission == null) {
                        _tabController.animateTo(index);
                      }
                    },
                    controller: _tabController,
                  padding: EdgeInsets.only(top: 2),
                  indicatorColor: Color.fromARGB(255, 160, 120, 18),
                  labelColor: Color.fromARGB(255, 160, 120, 18),
                  unselectedLabelColor: const Color.fromARGB(255, 83, 81, 81),
                  tabs: [
                    Tab(text: t.localeName == "sv" ? "V1" : "W1"),
                    Tab(text: t.localeName == "sv" ? "V2" : "W2"),
                    Tab(text: t.localeName == "sv" ? "V3" : "W3"),
                    Tab(text: t.localeName == "sv" ? "V4" : "W4"),
                    Tab(text: t.localeName == "sv" ? "V5" : "W5"),
                  ],
                ),
            )],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _weekTab(1, context),
                _weekTab(2, context),
                _weekTab(3, context),
                _weekTab(4, context),
                _weekTab(5, context),
              ],
            ),
          ),
        ],
      ),
  );
}


Widget _weekTab(int week, BuildContext context) {
  return SingleChildScrollView(
    child: Stack( 
      children: [ 
        Image.asset(bakgrund),
        Column(
          children: [
            SizedBox(height: 10,),
            ...generateWeekMissionCards(missionsMap, groupMissionsMap, week, context),
          ],
        ),
      ]
    )
  );
}

  Widget createMissionCard(dynamic element, BuildContext context) {
    var t = AppLocalizations.of(context)!;
    
      if(element is AdventureMissionRead){
        Container container =
        Container(
          height: widget.availableHeight/8,
          width: widget.availableWidth-40,
          child: Card(
            shadowColor: Colors.transparent,
            color: Colors.transparent,
            surfaceTintColor: null,
            child: InkWell(
              onTap: () => (),
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset(start, fit: BoxFit.fill,)),
                  Column(
                    children: [
                      SizedBox(height: widget.availableHeight/50,),
                      Center(child: 
                        Text(
                          textAlign: TextAlign.center,
                          t.localeName == "sv" ? element.titleSv : element.titleEn,
                          style: TextStyle(
                            fontFamily: "MinionPro",
                            fontWeight: FontWeight.w600,
                            fontSize: widget.availableWidth / 20,
                            color: Color(0xFFFCBD1D)
                          ),
                        )),
                        SizedBox(height: widget.availableHeight/100,),
                        Center(
                          child: Text(
                            element.minPoints == element.maxPoints ? element.maxPoints.toString() : "${element.minPoints} - ${element.maxPoints} ${t.introductionPoints2}",
                            style: TextStyle(
                                    fontFamily: "MinionPro",
                                    fontWeight: FontWeight.normal,
                                    fontSize: widget.availableWidth / 25,
                                    color: Colors.black
                                  ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
        
        return container;

      } else if (element is GroupMissionRead) {
        switch (element.isAccepted){
          case "Accepted": {
            Container container =
              Container(
                height: widget.availableHeight/8,
                width: widget.availableWidth-40,
                child: Card(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  surfaceTintColor: null,
                  child: InkWell(
                    onTap: () => (),
                    child: Stack(
                      children: [
                        Positioned.fill(child: Image.asset(avklarad, fit: BoxFit.fill,)),
                        Column(
                          children: [
                            SizedBox(height: widget.availableHeight/50,),
                            Center(child: 
                              Text(
                                textAlign: TextAlign.center,
                                t.localeName == "sv" ? element.adventureMission.titleSv : element.adventureMission.titleEn,
                                style: TextStyle(
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.w600,
                                  fontSize: widget.availableWidth / 20,
                                  color: Color(0xFFFCBD1D)
                                ),
                              )),
                              SizedBox(height: widget.availableHeight/100,),
                              Center(
                                child: Text(
                                      "${element.points} / ${element.adventureMission.maxPoints} ${t.introductionPoints2}",
                                  style: TextStyle(
                                          fontFamily: "MinionPro",
                                          fontWeight: FontWeight.normal,
                                          fontSize: widget.availableWidth / 25,
                                          color: Colors.black
                                        ),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
              
              return container;

          }

          case "Failed": {
            Container container =
              Container(
                height: widget.availableHeight/8,
                width: widget.availableWidth-40,
                child: Card(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  surfaceTintColor: null,
                  child: InkWell(
                    onTap: () => (),
                    child: Stack(
                      children: [
                        Positioned.fill(child: Image.asset(misslyckad, fit: BoxFit.fill,)),
                        Column(
                          children: [
                            SizedBox(height: widget.availableHeight/50,),
                            Center(child: 
                              Text(
                                textAlign: TextAlign.center,
                                t.localeName == "sv" ? element.adventureMission.titleSv : element.adventureMission.titleEn,
                                style: TextStyle(
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.w600,
                                  fontSize: widget.availableWidth / 20,
                                  color: Color(0xFFFCBD1D)
                                ),
                              )),
                              SizedBox(height: widget.availableHeight/100,),
                              Center(
                                child: Text(
                                      "${0} / ${element.adventureMission.maxPoints} ${t.introductionPoints2}",
                                  style: TextStyle(
                                          fontFamily: "MinionPro",
                                          fontWeight: FontWeight.normal,
                                          fontSize: widget.availableWidth / 25,
                                          color: Colors.black
                                        ),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
              
              return container;

          }

          case "Review": {
            Container container =
              Container(
                height: widget.availableHeight/8,
                width: widget.availableWidth-40,
                child: Card(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  surfaceTintColor: null,
                  child: InkWell(
                    onTap: () => (),
                    child: Stack(
                      children: [
                        Positioned.fill(child: Image.asset(bedomning, fit: BoxFit.fill,)),
                        Column(
                          children: [
                            SizedBox(height: widget.availableHeight/50,),
                            Center(child: 
                              Text(
                                textAlign: TextAlign.center,
                                t.localeName == "sv" ? element.adventureMission.titleSv : element.adventureMission.titleEn,
                                style: TextStyle(
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.w600,
                                  fontSize: widget.availableWidth / 20,
                                  color: Color(0xFFFCBD1D)
                                ),
                              )),
                              SizedBox(height: widget.availableHeight/100,),
                              Center(
                                child: Text(
                                  element.adventureMission.minPoints == element.adventureMission.maxPoints ? 
                                    element.adventureMission.maxPoints.toString() : 
                                      "${element.adventureMission.maxPoints} - ${element.adventureMission.maxPoints} ${t.introductionPoints2}",
                                  style: TextStyle(
                                          fontFamily: "MinionPro",
                                          fontWeight: FontWeight.normal,
                                          fontSize: widget.availableWidth / 25,
                                          color: Colors.black
                                        ),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
              return container;
          }
        }
      } 
      return SizedBox();
  }


  List<Widget> generateWeekMissionCards(
    Map<int, List<AdventureMissionRead>> missionsMap,
    Map<int, List<GroupMissionRead>> groupMissionsMap,
    int week, BuildContext context) {

    final missionList = [];
    final allMissions = missionsMap[week];
    final groupMissions = groupMissionsMap[week];


    if(groupMissions != null) {
      allMissions?.forEach((mission) {
      if(groupMissions.any((groupMission) => groupMission.adventureMission.id == mission.id)) {
        missionList.add(groupMissions.firstWhere((groupMission) => (mission.id == groupMission.adventureMission.id)));
      } else {
        missionList.add(mission);
      }
    });
    } else {
      allMissions?.forEach((mission) => missionList.add(mission));
    }

    List<Widget> list = []; 
    missionList.forEach((element) => (list.add(createMissionCard(element, context))));


    return list;
  }

}