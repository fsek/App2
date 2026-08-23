import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/util/nollning/week_tracker.dart';

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

  String ej_vald = "assets/data/nollning_26/uppdrag/ej_vald.png";
  String vald = "assets/data/nollning_26/uppdrag/vald.png";
  String done_check = "assets/data/nollning_26/uppdrag/done_check.png";
  String done_pixelart_placeholder =
      "assets/data/nollning_26/uppdrag/done_pixelart_placeholder.png";
  String blue = "assets/data/nollning_26/uppdrag/knapp_blue.png";
  String orange = "assets/data/nollning_26/uppdrag/knapp_orange.png";
  String purple = "assets/data/nollning_26/uppdrag/knapp_purple.png";
  String red = "assets/data/nollning_26/uppdrag/knapp_red.png";
  String yellow = "assets/data/nollning_26/uppdrag/knapp_yellow.png";
  String pixelart_placeholder =
      "assets/data/nollning_26/uppdrag/pixelart_placeholder.png";
  String pixelart_barbiedans =
      "assets/data/nollning_26/uppdrag/pixelart_barbiedans.png";
  String pixelart_fadder =
      "assets/data/nollning_26/uppdrag/pixelart_fadder.png";
  String pixelart_kreativ =
      "assets/data/nollning_26/uppdrag/pixelart_kreativ.png";
  String pixelart_resa = "assets/data/nollning_26/uppdrag/pixelart_resa.png";
  String pixelart_spel = "assets/data/nollning_26/uppdrag/pixelart_spel.png";
  String pixelart_tavling =
      "assets/data/nollning_26/uppdrag/pixelart_tävling.png";
  String pixelart_alg = "assets/data/nollning_26/uppdrag/pixelart_älg.png";
  String poke_kort = "assets/data/nollning_26/uppdrag/pokekort_exkl.jpg";
  String clouds = "assets/data/nollning_26/uppdrag/clouds.png";
  String turn_in_sv = "assets/data/nollning_26/uppdrag/lämna_in_uppdrag.png";
  String turn_in_en = "assets/data/nollning_26/uppdrag/turn_in_quest.png";
  String vecka_0 = "assets/data/nollning_26/uppdrag/vecka0.png";
  String vecka_1 = "assets/data/nollning_26/uppdrag/vecka1.png";
  String vecka_2 = "assets/data/nollning_26/uppdrag/vecka2.png";
  String vecka_3 = "assets/data/nollning_26/uppdrag/vecka3.png";
  String vecka_4 = "assets/data/nollning_26/uppdrag/vecka4.png";
  String week_0 = "assets/data/nollning_26/uppdrag/week0.png";
  String week_1 = "assets/data/nollning_26/uppdrag/week1.png";
  String week_2 = "assets/data/nollning_26/uppdrag/week2.png";
  String week_3 = "assets/data/nollning_26/uppdrag/week3.png";
  String week_4 = "assets/data/nollning_26/uppdrag/week4.png";

  int _checkNollningWeek() {
    return 0;
    //return WeekTracker.determineWeek();
  }

  @override
  void initState() {
    super.initState();

    this._tabController = TabController(
      length: 3,
      initialIndex: 2,
      vsync: this,
    ); //_checkNollningWeek()

    _loadInitData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _refresh() {
    setState(() {
      this.missionsMap = {};
      this.groupMissionsMap = {};
      this.user = null;
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
            nollningId: nollningData.id,
          );
      if (missions.data != null) {
        missionList = missions.data!.toList();
      }
      nollningGroupData = await _findUserNollningGroup(
        nollningData,
        userData.id,
      );
      if (nollningGroupData != null) {
        final groupmissions = await ApiService.apiClient
            .getNollningApi()
            .nollningGetGroupMissionsFromNollningGroup(
              nollningGroupId: nollningGroupData.id,
            );
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
                this.missionsMap
                    .putIfAbsent(mission.nollningWeek, () => [])
                    .add(mission);
              })
            : ();
        groupMissionList != null
            ? groupMissionList.forEach((groupmission) {
                this.groupMissionsMap
                    .putIfAbsent(
                      groupmission.adventureMission.nollningWeek,
                      () => [],
                    )
                    .add(groupmission);
              })
            : ();
      });
    }
  }

  NollningGroupRead? _findUserNollningGroup(NollningRead nollning, int userId) {
    try {
      final nollningGroup = nollning.nollningGroups.firstWhere(
        (nollningGroup) => (nollningGroup.group.groupUsers.any(
          (groupUser) => groupUser.user.id == userId,
        )),
      );
      return nollningGroup;
    } catch (e) {
      return null;
    }
  }

  // bool isSameDay(DateTime a, DateTime b) {
  //   print((a.year == b.year) && (a.month == b.month) && (a.day == b.day));
  //   return ((a.year == b.year) && (a.month == b.month) && (a.day == b.day));
  // }

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
          child: Stack(children: [Center(child: CircularProgressIndicator())]),
        ),
      );
    }

    if (_tabController.length != 0)
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              width: widget.availableWidth,
              height: widget.availableHeight / 20,
              child: Row(
                children: List.generate(3, (index) {
                  final labels = ["Missed", "Completed", "Current"];
                  return Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (selectedMission == null) {
                          _tabController.animateTo(index);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.availableWidth / 30,
                        ),
                        child: AnimatedBuilder(
                          animation: _tabController,
                          builder: (context, _) {
                            final isSelected = _tabController.index == index;
                            return Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    isSelected ? vald : ej_vald,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    labels[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.orange
                                          : Colors.blue,
                                      fontFamily: "Consolas",
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _questTab(false, context), // Ej avklarade
                  _questTab(true, context), // Avklarade
                  _questTab(null, context), // Alla
                ],
              ),
            ),
          ],
        ),
      );
    return Container(
      height: widget.availableHeight,
      width: widget.availableWidth,
    );
  }

  String _pointsFromMission(GroupMissionRead mission, BuildContext context) {
    var t = AppLocalizations.of(context)!;
    String finalString;

    switch (mission.isAccepted) {
      case "Accepted":
        finalString =
            "${mission.points} / ${mission.adventureMission.maxPoints} ${t.introductionPoints2}";
        break;

      case "Failed":
        finalString =
            "${0} / ${mission.adventureMission.maxPoints} ${t.introductionPoints2}";
        break;

      case "Review":
        finalString =
            mission.adventureMission.minPoints ==
                mission.adventureMission.maxPoints
            ? mission.adventureMission.maxPoints.toString()
            : "${mission.adventureMission.minPoints} - ${mission.adventureMission.maxPoints} ${t.introductionPoints2}";
        break;

      default:
        finalString = "";
        break;
    }

    return finalString;
  }

  // Not used right now, do we want them to be able to cancel attempts here... I dont think so (You would need manage permission anyway so...)
  Future<void> _removeMissionAttempt(
    int adventureMissionId,
    BuildContext context,
  ) async {
    var t = AppLocalizations.of(context)!;

    try {
      final gmDelete = GroupMissionDelete(
        (b) => b..adventureMissionId = adventureMissionId,
      );
      final response = await ApiService.apiClient
          .getNollningApi()
          .nollningDeleteGroupMission(
            nollningGroupId: nollningGroup!.id,
            groupMissionDelete: gmDelete,
          );

      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(t.localeName == "sv" ? "Lyckat!" : "Success!"),
            content: Text(
              t.localeName == "sv"
                  ? "Uppdragsförsök borttaget!"
                  : "Mission attempt removed",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _refresh();
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(t.localeName == "sv" ? "Misslyckat!" : "Failure!"),
            content: Text(
              t.localeName == "sv"
                  ? "Misslyckad borttagning av försök"
                  : "Registration removal failed",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> _sendMissionAttempt(
    AdventureMissionRead adventureMission,
    BuildContext context,
    VoidCallback onClose,
  ) async {
    var t = AppLocalizations.of(context)!;

    if (adventureMission.nollningWeek != (_checkNollningWeek())) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(
            t.localeName == "sv" ? "Misslyckat!" : "Failure!",
            style: TextStyle(
              fontFamily: "Consolas",
              fontWeight: FontWeight.w600,
              fontSize: widget.availableWidth / 20,
              color: Colors.black,
            ),
          ),
          content: Text(
            t.localeName == "sv"
                ? "Misslyckad registrering!\nUppdragsregistrering för denna veckan har stängt!"
                : "Falied to register mission!\nMission registration for this week has closed!",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
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
            groupMissionCreate: gm,
            nollningGroupId: nollningGroup!.id,
          );

      if (mounted) {
        showDialog(
          context: this.context,
          builder: (dialogContext) => AlertDialog(
            title: Text(
              t.localeName == "sv" ? "Lyckat!" : "Success!",
              style: TextStyle(
                fontFamily: "Consolas",
                fontWeight: FontWeight.w600,
                fontSize: widget.availableWidth / 20,
                color: Colors.black,
              ),
            ),
            content: Text(
              t.localeName == "sv"
                  ? "Uppdragsförsök registerat!"
                  : "Mission attempt registered",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  _refresh();
                  onClose(); // stänger hela mission-detaljvyn
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: this.context,
          builder: (dialogContext) => AlertDialog(
            title: Text(
              t.localeName == "sv" ? "Misslyckat!" : "Failure!",
              style: TextStyle(
                fontFamily: "Consolas",
                fontWeight: FontWeight.w600,
                fontSize: widget.availableWidth / 20,
                color: Colors.black,
              ),
            ),
            content: Text(
              t.localeName == "sv"
                  ? "Misslyckad registrering"
                  : "Registration failed",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  void _openMission(dynamic element, BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (ctx, _, __) =>
            _missionDetails(element, ctx, () => Navigator.of(ctx).pop()),
      ),
    );
  }

  Widget _missionDetails(
    dynamic mission,
    BuildContext context,
    VoidCallback onClose,
  ) {
    var t = AppLocalizations.of(context)!;

    if (mission is AdventureMissionRead) {
      return Material(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClose,
          child: Container(
            height: widget.availableHeight,
            width: widget.availableWidth,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    poke_kort,
                    fit: BoxFit.fill,
                    cacheWidth: 1440,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: widget.availableHeight * 0.27),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      width: widget.availableHeight * 0.35,
                      height: widget.availableHeight * 0.35,
                      _pixelArt(mission),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: widget.availableHeight * 0.14),
                  child: Row(
                    children: [
                      Image.asset(
                        _week_image(mission.nollningWeek, t.localeName == "sv"),
                        width: widget.availableWidth * 0.22,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: widget.availableWidth * 0.03,
                        ),
                        child: Text(
                          t.localeName == "sv"
                              ? (mission.titleSv.length <= 21
                                    ? mission.titleSv
                                    : mission.titleSv.substring(0, 18) + "...")
                              : (mission.titleEn.length <= 21
                                    ? mission.titleEn
                                    : mission.titleEn.substring(0, 18) + "..."),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: widget.availableWidth / 15,
                            color: Colors.black, // Color(0xFFFCBD1D)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      SizedBox(height: widget.availableHeight * 0.73),
                      SizedBox(
                        height: widget.availableHeight * 0.30,
                        child: SingleChildScrollView(
                          child: Text(
                            t.localeName == "sv"
                                ? mission.descriptionSv
                                : mission.descriptionEn,
                            style: TextStyle(
                              fontFamily: "Consolas",
                              fontWeight: FontWeight.normal,
                              fontSize: widget.availableWidth / 20,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          mission.minPoints == mission.maxPoints
                              ? mission.maxPoints.toString()
                              : "${mission.minPoints} - ${mission.maxPoints} ${t.introductionPoints2}",
                          style: TextStyle(
                            fontFamily: "LoRes12OT",
                            fontWeight: FontWeight.w600,
                            fontSize: widget.availableWidth / 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: widget.availableHeight * 0.13,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: widget.availableHeight / 15,
                      width: widget.availableWidth,
                      child: InkWell(
                        splashColor:
                            Colors.transparent, // Remove splash transparency
                        highlightColor:
                            Colors.transparent, // Remove highlight transparency
                        borderRadius: BorderRadius.circular(12),
                        onTap: () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (dialogContext) => AlertDialog(
                              content: Text(
                                t.localeName == "sv"
                                    ? "Registrera uppdragsförsök?"
                                    : "Register quest attempt?",
                                style: TextStyle(
                                  fontFamily: "Consolas",
                                  fontWeight: FontWeight.w600,
                                  fontSize: widget.availableWidth / 20,
                                  color: Colors.black,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(dialogContext).pop(true),
                                  child: Text(t.eventYes),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(dialogContext).pop(false),
                                  child: Text(t.eventNo),
                                ),
                              ],
                            ),
                          );
                          if (confirmed == true) {
                            await _sendMissionAttempt(
                              mission,
                              context,
                              onClose,
                            );
                          }
                        },
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                t.localeName == "sv" ? turn_in_sv : turn_in_en,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (mission is GroupMissionRead) {
      return Material(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClose,
          child: Container(
            height: widget.availableHeight,
            width: widget.availableWidth,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    poke_kort,
                    fit: BoxFit.fill,
                    cacheWidth: 1440,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: widget.availableHeight * 0.27),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      width: widget.availableHeight * 0.35,
                      height: widget.availableHeight * 0.35,
                      _pixelArt(mission),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: widget.availableHeight * 0.14),
                  child: Row(
                    children: [
                      Image.asset(
                        _week_image(
                          mission.adventureMission.nollningWeek,
                          t.localeName == "sv",
                        ),
                        width: widget.availableWidth * 0.22,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: widget.availableWidth * 0.03,
                        ),
                        child: Text(
                          t.localeName == "sv"
                              ? (mission.adventureMission.titleSv.length <= 21
                                    ? mission.adventureMission.titleSv
                                    : mission.adventureMission.titleSv
                                              .substring(0, 18) +
                                          "...")
                              : (mission.adventureMission.titleEn.length <= 21
                                    ? mission.adventureMission.titleEn
                                    : mission.adventureMission.titleEn
                                              .substring(0, 18) +
                                          "..."),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: widget.availableWidth / 15,
                            color: Colors.black, // Color(0xFFFCBD1D)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      SizedBox(height: widget.availableHeight * 0.73),
                      SizedBox(
                        height: widget.availableHeight * 0.30,
                        child: SingleChildScrollView(
                          child: Text(
                            t.localeName == "sv"
                                ? mission.adventureMission.descriptionSv
                                : mission.adventureMission.descriptionEn,
                            style: TextStyle(
                              fontFamily: "Consolas",
                              fontWeight: FontWeight.normal,
                              fontSize: widget.availableWidth / 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          _pointsFromMission(mission, context),
                          style: TextStyle(
                            fontFamily: "LoRes12OT",
                            fontWeight: FontWeight.w600,
                            fontSize: widget.availableWidth / 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(child: _missionReview(context, mission)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SizedBox();
  }

  Widget _questTab(bool? completedQuestsTab, BuildContext context) {
    // completedQuestsTab: true = "Completed", false = "Missed", None = "Current"

    return Container(
      height: widget.availableHeight,
      width: widget.availableWidth,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: widget.availableHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    ...generateTabMissionCards(
                      missionsMap,
                      groupMissionsMap,
                      completedQuestsTab,
                      context,
                    ),
                    if (completedQuestsTab == null) ...[
                      Spacer(),
                      Image.asset(clouds),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createMissionCard(dynamic element, BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (element is AdventureMissionRead) {
      Container container = Container(
        height: widget.availableHeight / 6,
        width: widget.availableWidth - 40,
        child: Card(
          shadowColor: Colors.transparent,
          color: Colors.transparent,
          surfaceTintColor: null,
          child: InkWell(
            onTap: () {
              _openMission(element, context);
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(_buttonArt(element), fit: BoxFit.fill),
                ),
                Positioned(
                  left: widget.availableHeight / 6 * 0.08,
                  top: widget.availableHeight / 6 * 0.1,
                  child: SizedBox(
                    width: widget.availableHeight / 6 * 0.73,
                    height: widget.availableHeight / 6 * 0.73,
                    child: Stack(
                      children: [
                        Image.asset(pixelart_placeholder, fit: BoxFit.contain),
                        Positioned.fill(
                          child: Center(
                            child: Image.asset(
                              _pixelArt(element),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left:
                          widget.availableHeight / 6 * 0.1 + // left margin
                          widget.availableHeight / 6 * 0.7 + // image width
                          20,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        t.localeName == "sv"
                            ? (element.titleSv.length <= 40
                                  ? element.titleSv
                                  : element.titleSv.substring(0, 35) + "...")
                            : (element.titleEn.length <= 40
                                  ? element.titleEn
                                  : element.titleEn.substring(0, 35) + "..."),
                        style: TextStyle(
                          fontFamily: "LoRes12OT",
                          fontWeight: FontWeight.w600,
                          fontSize: widget.availableWidth / 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
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
              height: widget.availableHeight / 6,
              width: widget.availableWidth - 40,
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                surfaceTintColor: null,
                child: InkWell(
                  onTap: () {
                    _openMission(element, context);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          _buttonArt(element),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: widget.availableHeight / 6 * 0.08,
                        top: widget.availableHeight / 6 * 0.1,
                        child: SizedBox(
                          width: widget.availableHeight / 6 * 0.73,
                          height: widget.availableHeight / 6 * 0.73,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Center(
                                  child: Image.asset(
                                    _pixelArt(element),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Image.asset(
                                done_pixelart_placeholder,
                                fit: BoxFit.contain,
                              ),
                              Image.asset(done_check, fit: BoxFit.contain),
                            ],
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left:
                                widget.availableHeight /
                                    6 *
                                    0.1 + // left margin
                                widget.availableHeight /
                                    6 *
                                    0.7 + // image width
                                20,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              t.localeName == "sv"
                                  ? (element.adventureMission.titleSv.length <=
                                            40
                                        ? element.adventureMission.titleSv
                                        : element.adventureMission.titleSv
                                                  .substring(0, 35) +
                                              "...")
                                  : (element.adventureMission.titleEn.length <=
                                            40
                                        ? element.adventureMission.titleEn
                                        : element.adventureMission.titleEn
                                                  .substring(0, 35) +
                                              "..."),
                              style: TextStyle(
                                fontFamily: "LoRes12OT",
                                fontWeight: FontWeight.w600,
                                fontSize: widget.availableWidth / 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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
              height: widget.availableHeight / 6,
              width: widget.availableWidth - 40,
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                surfaceTintColor: null,
                child: InkWell(
                  onTap: () {
                    _openMission(element, context);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          _buttonArt(element),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: widget.availableHeight / 6 * 0.08,
                        top: widget.availableHeight / 6 * 0.1,
                        child: SizedBox(
                          width: widget.availableHeight / 6 * 0.73,
                          height: widget.availableHeight / 6 * 0.73,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Center(
                                  child: Image.asset(
                                    _pixelArt(element),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Image.asset(
                                done_pixelart_placeholder,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left:
                                widget.availableHeight /
                                    6 *
                                    0.1 + // left margin
                                widget.availableHeight /
                                    6 *
                                    0.7 + // image width
                                20,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              t.localeName == "sv"
                                  ? (element.adventureMission.titleSv.length <=
                                            40
                                        ? element.adventureMission.titleSv
                                        : element.adventureMission.titleSv
                                                  .substring(0, 35) +
                                              "...")
                                  : (element.adventureMission.titleEn.length <=
                                            40
                                        ? element.adventureMission.titleEn
                                        : element.adventureMission.titleEn
                                                  .substring(0, 35) +
                                              "..."),
                              style: TextStyle(
                                fontFamily: "LoRes12OT",
                                fontWeight: FontWeight.w600,
                                fontSize: widget.availableWidth / 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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
              height: widget.availableHeight / 6,
              width: widget.availableWidth - 40,
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                surfaceTintColor: null,
                child: InkWell(
                  onTap: () {
                    _openMission(element, context);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          _buttonArt(element),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: widget.availableHeight / 6 * 0.08,
                        top: widget.availableHeight / 6 * 0.1,
                        child: SizedBox(
                          width: widget.availableHeight / 6 * 0.73,
                          height: widget.availableHeight / 6 * 0.73,
                          child: Stack(
                            children: [
                              Image.asset(
                                pixelart_placeholder,
                                fit: BoxFit.contain,
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Image.asset(
                                    _pixelArt(element),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Image.asset(
                                done_pixelart_placeholder,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left:
                                widget.availableHeight /
                                    6 *
                                    0.1 + // left margin
                                widget.availableHeight /
                                    6 *
                                    0.7 + // image width
                                20,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              t.localeName == "sv"
                                  ? (element.adventureMission.titleSv.length <=
                                            40
                                        ? element.adventureMission.titleSv
                                        : element.adventureMission.titleSv
                                                  .substring(0, 35) +
                                              "...")
                                  : (element.adventureMission.titleEn.length <=
                                            40
                                        ? element.adventureMission.titleEn
                                        : element.adventureMission.titleEn
                                                  .substring(0, 35) +
                                              "..."),
                              style: TextStyle(
                                fontFamily: "LoRes12OT",
                                fontWeight: FontWeight.w600,
                                fontSize: widget.availableWidth / 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        );

      case "Failed":
        return Text(
          t.localeName == "sv" ? "Uppdrag misslyckat" : "Mission failed",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        );

      default:
        return Text(
          t.localeName == "sv"
              ? "Uppdrag under granskning"
              : "Mission under review",
          style: TextStyle(
            color: Color(0xFFcfac23),
            fontWeight: FontWeight.bold,
          ),
        );
    }
  }

  List<Widget> generateTabMissionCards(
    Map<int, List<AdventureMissionRead>> missionsMap,
    Map<int, List<GroupMissionRead>> groupMissionsMap,
    bool? completedQuestsTab, // true=completed, false=missed, None=current
    BuildContext context,
  ) {
    final week = _checkNollningWeek();
    final allMissions = [];
    final groupMissions = [];

    if (completedQuestsTab == null) {
      allMissions.addAll(missionsMap[week] ?? []);
      groupMissions.addAll(groupMissionsMap[week] ?? []);
    } else {
      for (int w = 0; w <= week; w += 1) {
        allMissions.addAll(missionsMap[w] ?? []);
        groupMissions.addAll(groupMissionsMap[w] ?? []);
      }
    }

    final missionList = [];
    allMissions.forEach((mission) {
      if (groupMissions.any(
        (groupMission) => groupMission.adventureMission.id == mission.id,
      )) {
        missionList.add(
          groupMissions.firstWhere(
            (groupMission) => (mission.id == groupMission.adventureMission.id),
          ),
        );
      } else {
        missionList.add(mission);
      }
    });

    var filteredMissionList = missionList;
    if (completedQuestsTab == true) {
      filteredMissionList = missionList.where((m) => _isCompleted(m)).toList();
    } else if (completedQuestsTab == false) {
      // A past week's quest that was never attempted never becomes a
      // GroupMission, so without this it shows up in no tab at all.
      filteredMissionList = missionList
          .where(
            (m) =>
                _isFailed(m) ||
                (m is AdventureMissionRead && m.nollningWeek < week),
          )
          .toList();
    }

    List<Widget> list = [];
    filteredMissionList.forEach(
      (element) => (list.add(createMissionCard(element, context))),
    );

    return list;
  }

  bool _isCompleted(dynamic mission) {
    if (mission is GroupMissionRead) {
      return mission.isAccepted == "Accepted" || mission.isAccepted == "Review";
    }
    return false;
  }

  bool _isFailed(dynamic mission) {
    if (mission is GroupMissionRead) {
      return mission.isAccepted == "Failed";
    }
    return false;
  }

  String _pixelArt(dynamic mission) {
    String category = "";
    String pixelArt;
    if (mission is AdventureMissionRead) {
      category = mission.missionCategory;
    } else if (mission is GroupMissionRead) {
      category = mission.adventureMission.missionCategory;
    }
    switch (category) {
      case "Barbiedans":
        pixelArt = pixelart_barbiedans;
        break;
      case "Fadder":
        pixelArt = pixelart_fadder;
        break;
      case "Kreativ":
        pixelArt = pixelart_kreativ;
        break;
      case "Resa":
        pixelArt = pixelart_resa;
        break;
      case "Spel":
        pixelArt = pixelart_spel;
        break;
      case "Tävling":
        pixelArt = pixelart_tavling;
        break;
      case "Älg":
        pixelArt = pixelart_alg;
        break;
      default:
        pixelArt = pixelart_placeholder;
        break;
    }
    return pixelArt;
  }

  String _buttonArt(dynamic mission) {
    String category = "";
    String pixelArt;
    if (mission is AdventureMissionRead) {
      category = mission.missionCategory;
    } else if (mission is GroupMissionRead) {
      category = mission.adventureMission.missionCategory;
    }
    switch (category) {
      case "Barbiedans":
        pixelArt = purple;
        break;
      case "Fadder":
        pixelArt = orange;
        break;
      case "Kreativ":
        pixelArt = blue;
        break;
      case "Resa":
        pixelArt = orange;
        break;
      case "Spel":
        pixelArt = red;
        break;
      case "Tävling":
        pixelArt = yellow;
        break;
      case "Älg":
        pixelArt = orange;
        break;
      default:
        pixelArt = orange;
        break;
    }
    return pixelArt;
  }

  String _week_image(int week, bool lang) {
    if (lang) {
      switch (week) {
        case 0:
          return vecka_0;
        case 1:
          return vecka_1;
        case 2:
          return vecka_2;
        case 3:
          return vecka_3;
        default:
          return vecka_4;
      }
    } else {
      switch (week) {
        case 0:
          return week_0;
        case 1:
          return week_1;
        case 2:
          return week_2;
        case 3:
          return week_3;
        default:
          return week_4;
      }
    }
  }
}
