import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestScreen extends StatefulWidget {
  final double availableWidth;
  final double availableHeight;

  QuestScreen({required this.availableHeight, required this.availableWidth});

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen>
    with SingleTickerProviderStateMixin {
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

  int _checkNollningWeek() {
    if (DateTime.now().isAfter(DateTime(2025, 9, 21))) {
      return 5;
    } else if (DateTime.now().isAfter(DateTime(2025, 9, 14))) {
      return 4;
    } else if (DateTime.now().isAfter(DateTime(2025, 9, 7))) {
      return 3;
    } else if (DateTime.now().isAfter(DateTime(2025, 8, 31))) {
      return 2;
    } else if (DateTime.now().isAfter(DateTime(2025, 8, 24))) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();

    this._tabController = TabController(
        length: _checkNollningWeek(), vsync: this); //_checkNollningWeek()

    _loadInitData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void refresh() {
    setState(() {
      this.missionsMap = {};
      this.groupMissionsMap = {};
      this.user == null;
      this.nollning = null;
      this.nollningGroup = null;
      this.selectedMission = null;
    });
    _loadInitData();
  }

  Future<void> _loadInitData() async {
    final user = await ApiService.apiClient.getUsersApi().usersGetMe();
    final userData = user.data;
    final nollning = await ApiService.apiClient
        .getNollningApi()
        .nollningGetNollningByYear(year: DateTime.now().year);
    final nollningData = nollning.data;
    List<AdventureMissionRead>? missionList;
    NollningGroupRead? nollningGroupData;
    List<GroupMissionRead>? groupMissionList;

    if (nollningData != null && userData != null) {
      final missions = await ApiService.apiClient
          .getNollningApi()
          .nollningGetAllAdventureMissionsInNollning(
              nollningId: nollningData.id);
      if (missions.data != null) {
        missionList = missions.data!.toList();
      }
      nollningGroupData =
          await findUserNollningGroup(nollningData, userData.id);
      if (nollningGroupData != null) {
        final groupmissions = await ApiService.apiClient
            .getNollningApi()
            .nollningGetGroupMissionsFromNollningGroup(
                nollningGroupId: nollningGroupData.id);
        groupmissions.data != null
            ? groupMissionList = groupmissions.data?.toList()
            : ();
      }

      setState(() {
        this.user = userData;
        this.nollning = nollningData;
        this.nollningGroup = nollningGroupData;
        missionList != null
            ? missionList.forEach((mission) {
                this
                    .missionsMap
                    .putIfAbsent(mission.nollningWeek, () => [])
                    .add(mission);
              })
            : ();
        groupMissionList != null
            ? groupMissionList.forEach((groupmission) {
                this
                    .groupMissionsMap
                    .putIfAbsent(
                        groupmission.adventureMission.nollningWeek, () => [])
                    .add(groupmission);
              })
            : ();
      });
    }
  }

  NollningGroupRead? findUserNollningGroup(NollningRead nollning, int userId) {
    try {
      final nollningGroup = nollning.nollningGroups.firstWhere(
          (nollningGroup) => (nollningGroup.group.groupUsers
              .any((groupUser) => groupUser.user.id == userId)));
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

    if (user == null || nollning == null) {
      return Scaffold(
          body: Container(
        height: widget.availableHeight,
        width: widget.availableWidth,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              bakgrund,
              fit: BoxFit.fill,
            )),
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ));
    }

    if (_tabController.length != 0)
      return Scaffold(
        body: Column(
          children: [
            Container(
              width: widget.availableWidth,
              height: widget.availableHeight / 20,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    bakgrund,
                    fit: BoxFit.fill,
                  )),
                  Container(
                    // height: widget.availableHeight,
                    width: widget.availableWidth - 40,
                    child: TabBar(
                      onTap: (index) {
                        if (selectedMission == null) {
                          _tabController.animateTo(index);
                        }
                      },
                      controller: _tabController,
                      padding: EdgeInsets.only(top: 2),
                      indicatorColor: Color.fromARGB(255, 160, 120, 18),
                      labelColor: Color.fromARGB(255, 160, 120, 18),
                      unselectedLabelColor:
                          const Color.fromARGB(255, 83, 81, 81),
                      tabs: [
                        // Tab(text: t.localeName == "sv" ? "V0" : "W0"),
                        // Tab(text: t.localeName == "sv" ? "V2" : "W2"),
                        // Tab(text: t.localeName == "sv" ? "V3" : "W3"),
                        // Tab(text: t.localeName == "sv" ? "V4" : "W4"),
                        // Tab(text: t.localeName == "sv" ? "V5" : "W5"),
                        if (DateTime.now().isAfter(
                            DateTime(2025, 8, 24))) // This is cursed but i cba
                          Tab(text: t.localeName == "sv" ? "V0" : "W0"),
                        if (DateTime.now().isAfter(DateTime(2025, 8, 31)))
                          Tab(text: t.localeName == "sv" ? "V1" : "W1"),
                        if (DateTime.now().isAfter(DateTime(2025, 9, 7)))
                          Tab(text: t.localeName == "sv" ? "V2" : "W2"),
                        if (DateTime.now().isAfter(DateTime(2025, 9, 14)))
                          Tab(text: t.localeName == "sv" ? "V3" : "W3"),
                        if (DateTime.now().isAfter(DateTime(2025, 9, 21)))
                          Tab(text: t.localeName == "sv" ? "V4" : "W4"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // _weekTab(1, context),
                  // _weekTab(2, context),
                  // _weekTab(3, context),
                  // _weekTab(4, context),
                  // _weekTab(5, context),
                  if (DateTime.now().isAfter(DateTime(2025, 8, 24)))
                    _weekTab(0, context), // This is cursed but i cba
                  if (DateTime.now().isAfter(DateTime(2025, 8, 31)))
                    _weekTab(1, context),
                  if (DateTime.now().isAfter(DateTime(2025, 9, 7)))
                    _weekTab(2, context),
                  if (DateTime.now().isAfter(DateTime(2025, 9, 14)))
                    _weekTab(3, context),
                  if (DateTime.now().isAfter(DateTime(2025, 9, 21)))
                    _weekTab(4, context),
                ],
              ),
            ),
          ],
        ),
      );

    return Container(
        height: widget.availableHeight,
        width: widget.availableWidth,
        child: Image.asset(bakgrund, fit: BoxFit.fill));
  }

  String _pointsFromMission(GroupMissionRead mission, BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String finalString;

    switch (mission.isAccepted) {
      case "Accepted":
        finalString =
            "${mission.points} / ${mission.adventureMission.maxPoints} ${t.introductionPoints2}";

      case "Failed":
        finalString =
            "${0} / ${mission.adventureMission.maxPoints} ${t.introductionPoints2}";

      case "Review":
        finalString = mission.adventureMission.minPoints ==
                mission.adventureMission.maxPoints
            ? mission.adventureMission.maxPoints.toString()
            : "${mission.adventureMission.minPoints} - ${mission.adventureMission.maxPoints} ${t.introductionPoints2}";

      default:
        finalString = "";
    }

    return finalString;
  }

  // Not used right now, do we want them to be able to cancel attempts here... I dont think so (You would need manage permission anyway so...)
  Future<void> _removeMissionAttempt(
      int adventureMissionId, BuildContext context) async {
    var t = AppLocalizations.of(context)!;

    try {
      final gmDelete =
          GroupMissionDelete((b) => b..adventureMissionId = adventureMissionId);
      final response = await ApiService.apiClient
          .getNollningApi()
          .nollningDeleteGroupMission(
              nollningGroupId: nollningGroup!.id, groupMissionDelete: gmDelete);

      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(t.localeName == "sv" ? "Lyckat!" : "Success!"),
                  content: Text(t.localeName == "sv"
                      ? "Uppdragsförsök borttaget!"
                      : "Mission attempt removed"),
                  actions: [
                    TextButton(
                        onPressed: () => setState(() {
                              Navigator.of(context).pop();
                              refresh();
                            }),
                        child: Text("OK"))
                  ],
                ));
      }
    } catch (e) {
      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title:
                      Text(t.localeName == "sv" ? "Misslyckat!" : "Failure!"),
                  content: Text(t.localeName == "sv"
                      ? "Misslyckad borttagning av försök"
                      : "Registration removal failed"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("OK"))
                  ],
                ));
      }
    }
  }

  Future<void> _sendMissionAttempt(
      AdventureMissionRead adventureMission, BuildContext context) async {
    var t = AppLocalizations.of(context)!;

    if (adventureMission.nollningWeek != (_checkNollningWeek() - 1)) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(t.localeName == "sv" ? "Misslyckat!" : "Failure!"),
                content: Text(t.localeName == "sv"
                    ? "Misslyckad registrering!\nUppdragsregistrering för denna veckan har stängt!"
                    : "Falied to register mission!\nMission registration for this week has closed!"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("OK"))
                ],
              ));
      return;
    }
    try {
      final gm = GroupMissionCreate((b) {
        b..adventureMissionId = adventureMission.id;
        b..isAccepted = null;
        b..points = null;
      });
      final response = await ApiService.apiClient
          .getNollningApi()
          .nollningAddGroupMission(
              groupMissionCreate: gm, nollningGroupId: nollningGroup!.id);

      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(t.localeName == "sv" ? "Lyckat!" : "Success!"),
                  content: Text(t.localeName == "sv"
                      ? "Uppdragsförsök registerat!"
                      : "Mission attempt registered"),
                  actions: [
                    TextButton(
                        onPressed: () => setState(() {
                              Navigator.of(context).pop();
                              refresh();
                            }),
                        child: Text("OK"))
                  ],
                ));
      }
    } catch (e) {
      if (mounted) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title:
                      Text(t.localeName == "sv" ? "Misslyckat!" : "Failure!"),
                  content: Text(t.localeName == "sv"
                      ? "Misslyckad registrering"
                      : "Registration failed"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("OK"))
                  ],
                ));
      }
    }
  }

  Widget _missionDetails(dynamic mission, BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (mission is AdventureMissionRead) {
      return Container(
        height: widget.availableHeight,
        width: widget.availableWidth,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(bakgrund, fit: BoxFit.fill)),
            Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        t.localeName == "sv"
                            ? mission.titleSv
                            : mission.titleEn,
                        style: TextStyle(
                            fontFamily: "MinionPro",
                            fontWeight: FontWeight.w600,
                            fontSize: widget.availableWidth / 10,
                            color: Colors.black // Color(0xFFFCBD1D)
                            ),
                      ),
                    ),
                    Text(
                      t.localeName == "sv"
                          ? mission.descriptionSv
                          : mission.descriptionEn,
                      style: TextStyle(
                          fontFamily: "MinionPro",
                          fontWeight: FontWeight.normal,
                          fontSize: widget.availableWidth / 25),
                    ),
                    Center(
                      child: Text(
                        mission.minPoints == mission.maxPoints
                            ? mission.maxPoints.toString()
                            : "${mission.minPoints} - ${mission.maxPoints} ${t.introductionPoints2}",
                        style: TextStyle(
                          fontFamily: "MinionPro",
                          fontWeight: FontWeight.w600,
                          fontSize: widget.availableWidth / 22,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: widget.availableHeight / 15,
                        width: widget.availableWidth,
                        child: InkWell(
                            splashColor: Colors
                                .transparent, // Remove splash transparency
                            highlightColor: Colors
                                .transparent, // Remove highlight transparency
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              final parentContext = context;
                              showDialog(
                                  context: parentContext,
                                  builder: (dialogContext) => AlertDialog(
                                        content: Text(t.localeName == "sv"
                                            ? "Registera uppdragsförsök?"
                                            : "Register mission attempt?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.of(dialogContext)
                                                    .pop();
                                                await _sendMissionAttempt(
                                                    mission, parentContext);
                                              },
                                              child: Text(t.eventYes)),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(t.eventNo))
                                        ],
                                      ));
                            },
                            child: Stack(
                              children: [
                                Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          rubrik,
                                          fit: BoxFit.fitWidth,
                                        ))),
                                Center(
                                  child: Text(
                                    t.localeName == "sv"
                                        ? "Registrera försök"
                                        : "Register attempt",
                                    style: TextStyle(
                                      fontFamily: "MinionPro",
                                      fontWeight: FontWeight.w600,
                                      fontSize: widget.availableWidth / 20,
                                      color: Colors
                                          .black, // Optional: change to fit your theme
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                        height: widget.availableHeight / 30,
                        width: widget.availableWidth / 3,
                        child: InkWell(
                            splashColor: Colors
                                .transparent, // Remove splash transparency
                            highlightColor: Colors
                                .transparent, // Remove highlight transparency
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => setState(() {
                                  this.selectedMission = null;
                                }),
                            child: Stack(
                              children: [
                                Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          rubrik,
                                          fit: BoxFit.fitHeight,
                                        ))),
                                Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    t.localeName == "sv" ? "Tillbaka" : "Back",
                                    style: TextStyle(
                                      fontFamily: "MinionPro",
                                      fontWeight: FontWeight.w600,
                                      fontSize: widget.availableWidth / 20,
                                      color: Colors
                                          .black, // Optional: change to fit your theme
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      );
    }

    if (mission is GroupMissionRead) {
      return Container(
        height: widget.availableHeight,
        width: widget.availableWidth,
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset(bakgrund, fit: BoxFit.fill)),
            Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        t.localeName == "sv"
                            ? mission.adventureMission.titleSv
                            : mission.adventureMission.titleEn,
                        style: TextStyle(
                            fontFamily: "MinionPro",
                            fontWeight: FontWeight.w600,
                            fontSize: widget.availableWidth / 10,
                            color: Colors.black // Color(0xFFFCBD1D)
                            ),
                      ),
                    ),
                    Text(
                      t.localeName == "sv"
                          ? mission.adventureMission.descriptionSv
                          : mission.adventureMission.descriptionEn,
                      style: TextStyle(
                          fontFamily: "MinionPro",
                          fontWeight: FontWeight.normal,
                          fontSize: widget.availableWidth / 25),
                    ),
                    Center(
                      child: Text(
                        _pointsFromMission(mission, context),
                        style: TextStyle(
                          fontFamily: "MinionPro",
                          fontWeight: FontWeight.w600,
                          fontSize: widget.availableWidth / 22,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(child: _missionReview(context, mission)),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Container(
                        height: widget.availableHeight / 30,
                        width: widget.availableWidth / 3,
                        child: InkWell(
                            splashColor: Colors
                                .transparent, // Remove splash transparency
                            highlightColor: Colors
                                .transparent, // Remove highlight transparency
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => setState(() {
                                  this.selectedMission = null;
                                }),
                            child: Stack(
                              children: [
                                Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(
                                          rubrik,
                                          fit: BoxFit.fitHeight,
                                        ))),
                                Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    t.localeName == "sv" ? "Tillbaka" : "Back",
                                    style: TextStyle(
                                      fontFamily: "MinionPro",
                                      fontWeight: FontWeight.w600,
                                      fontSize: widget.availableWidth / 20,
                                      color: Colors
                                          .black, // Optional: change to fit your theme
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      );
    }

    return SizedBox();
  }

  Widget _weekTab(int week, BuildContext context) {
    if (selectedMission != null) {
      return _missionDetails(selectedMission, context);
    }

    return Container(
        height: widget.availableHeight,
        width: widget.availableWidth,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              bakgrund,
              fit: BoxFit.fill,
            )),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ...generateWeekMissionCards(
                      missionsMap, groupMissionsMap, week, context)
                ],
              ),
            )
          ],
        ));

    // SingleChildScrollView(
    //   // Image.asset(bakgrund),
    //   child: Container(
    //       width: widget.availableWidth,
    //       // height: double.infinity,
    //       color: Color(0xFFe8cfb7),
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             height: 10,
    //           ),
    //           ...generateWeekMissionCards(
    //               missionsMap, groupMissionsMap, week, context),
    //         ],
    //       )));
  }

  Widget createMissionCard(dynamic element, BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (element is AdventureMissionRead) {
      Container container = Container(
        height: widget.availableHeight / 8,
        width: widget.availableWidth - 40,
        child: Card(
          shadowColor: Colors.transparent,
          color: Colors.transparent,
          surfaceTintColor: null,
          child: InkWell(
            onTap: () => (setState(() {
              this.selectedMission = element;
            })),
            child: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                  start,
                  fit: BoxFit.fill,
                )),
                Column(
                  children: [
                    SizedBox(
                      height: widget.availableHeight / 50,
                    ),
                    Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      t.localeName == "sv" ? element.titleSv : element.titleEn,
                      style: TextStyle(
                          fontFamily: "MinionPro",
                          fontWeight: FontWeight.w600,
                          fontSize: widget.availableWidth / 20,
                          color: Color(0xFFFCBD1D)),
                    )),
                    SizedBox(
                      height: widget.availableHeight / 100,
                    ),
                    Center(
                      child: Text(
                        element.minPoints == element.maxPoints
                            ? element.maxPoints.toString()
                            : "${element.minPoints} - ${element.maxPoints} ${t.introductionPoints2}",
                        style: TextStyle(
                            fontFamily: "MinionPro",
                            fontWeight: FontWeight.normal,
                            fontSize: widget.availableWidth / 25,
                            color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );

      return Center(child: container);
    } else if (element is GroupMissionRead) {
      switch (element.isAccepted) {
        case "Accepted":
          {
            Container container = Container(
              height: widget.availableHeight / 8,
              width: widget.availableWidth - 40,
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                surfaceTintColor: null,
                child: InkWell(
                  onTap: () => (setState(() {
                    this.selectedMission = element;
                  })),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Image.asset(
                        avklarad,
                        fit: BoxFit.fill,
                      )),
                      Column(
                        children: [
                          SizedBox(
                            height: widget.availableHeight / 50,
                          ),
                          Center(
                              child: Text(
                            textAlign: TextAlign.center,
                            t.localeName == "sv"
                                ? element.adventureMission.titleSv
                                : element.adventureMission.titleEn,
                            style: TextStyle(
                                fontFamily: "MinionPro",
                                fontWeight: FontWeight.w600,
                                fontSize: widget.availableWidth / 20,
                                color: Color(0xFFFCBD1D)),
                          )),
                          SizedBox(
                            height: widget.availableHeight / 100,
                          ),
                          Center(
                            child: Text(
                              _pointsFromMission(element, context),
                              style: TextStyle(
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.normal,
                                  fontSize: widget.availableWidth / 25,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );

            return Center(child: container);
          }

        case "Failed":
          {
            Container container = Container(
              height: widget.availableHeight / 8,
              width: widget.availableWidth - 40,
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                surfaceTintColor: null,
                child: InkWell(
                  onTap: () => (setState(() {
                    this.selectedMission = element;
                  })),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Image.asset(
                        misslyckad,
                        fit: BoxFit.fill,
                      )),
                      Column(
                        children: [
                          SizedBox(
                            height: widget.availableHeight / 50,
                          ),
                          Center(
                              child: Text(
                            textAlign: TextAlign.center,
                            t.localeName == "sv"
                                ? element.adventureMission.titleSv
                                : element.adventureMission.titleEn,
                            style: TextStyle(
                                fontFamily: "MinionPro",
                                fontWeight: FontWeight.w600,
                                fontSize: widget.availableWidth / 20,
                                color: Color(0xFFFCBD1D)),
                          )),
                          SizedBox(
                            height: widget.availableHeight / 100,
                          ),
                          Center(
                            child: Text(
                              _pointsFromMission(element, context),
                              style: TextStyle(
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.normal,
                                  fontSize: widget.availableWidth / 25,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );

            return Center(child: container);
          }

        case "Review":
          {
            Container container = Container(
              height: widget.availableHeight / 8,
              width: widget.availableWidth - 40,
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                surfaceTintColor: null,
                child: InkWell(
                  onTap: () => (setState(() {
                    this.selectedMission = element;
                  })),
                  child: Stack(
                    children: [
                      Positioned.fill(
                          child: Image.asset(
                        bedomning,
                        fit: BoxFit.fill,
                      )),
                      Column(
                        children: [
                          SizedBox(
                            height: widget.availableHeight / 50,
                          ),
                          Center(
                              child: Text(
                            textAlign: TextAlign.center,
                            t.localeName == "sv"
                                ? element.adventureMission.titleSv
                                : element.adventureMission.titleEn,
                            style: TextStyle(
                                fontFamily: "MinionPro",
                                fontWeight: FontWeight.w600,
                                fontSize: widget.availableWidth / 20,
                                color: Color(0xFFFCBD1D)),
                          )),
                          SizedBox(
                            height: widget.availableHeight / 100,
                          ),
                          Center(
                            child: Text(
                              _pointsFromMission(element, context),
                              style: TextStyle(
                                  fontFamily: "MinionPro",
                                  fontWeight: FontWeight.normal,
                                  fontSize: widget.availableWidth / 25,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
            return Center(child: container);
          }
      }
    }
    return SizedBox();
  }

  Text _missionReview(BuildContext context, GroupMissionRead gm) {
    var t = AppLocalizations.of(context)!;
    switch (gm.isAccepted) {
      case "Accepted":
        return Text(
          t.localeName == "sv" ? "Uppdrag accepterat" : "Mission success",
          style: TextStyle(color: Colors.green),
        );

      case "Failed":
        return Text(
          t.localeName == "sv" ? "Uppdrag misslyckat" : "Mission failed",
          style: TextStyle(color: Colors.red),
        );

      default:
        return Text(
          t.localeName == "sv"
              ? "Uppdrag under granskning"
              : "Mission under review",
          style: TextStyle(color: Color(0xFFcfac23)),
        );
    }
  }

  List<Widget> generateWeekMissionCards(
      Map<int, List<AdventureMissionRead>> missionsMap,
      Map<int, List<GroupMissionRead>> groupMissionsMap,
      int week,
      BuildContext context) {
    final missionList = [];
    final allMissions = missionsMap[week];
    final groupMissions = groupMissionsMap[week];

    if (groupMissions != null) {
      allMissions?.forEach((mission) {
        if (groupMissions.any(
            (groupMission) => groupMission.adventureMission.id == mission.id)) {
          missionList.add(groupMissions.firstWhere((groupMission) =>
              (mission.id == groupMission.adventureMission.id)));
        } else {
          missionList.add(mission);
        }
      });
    } else {
      allMissions?.forEach((mission) => missionList.add(mission));
    }

    List<Widget> list = [];
    missionList
        .forEach((element) => (list.add(createMissionCard(element, context))));

    return list;
  }
}
