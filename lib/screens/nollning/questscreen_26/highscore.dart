import 'package:flutter/material.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

class HighscoreScreen extends StatefulWidget {
  final double availableWidth;
  final double availableHeight;

  HighscoreScreen({
    required this.availableHeight,
    required this.availableWidth,
  });

  @override
  _HighscoreScreenState createState() => _HighscoreScreenState();
}

class _HighscoreScreenState extends State<HighscoreScreen> {
  Map<NollningGroupRead, int> groupPointsMap = {};
  NollningRead? nollning;

  String avklarad = "assets/data/nollning_25/uppdrag/bricka-avklarad.png";
  String bedomning = "assets/data/nollning_25/uppdrag/bricka-bedomning.png";
  String misslyckad = "assets/data/nollning_25/uppdrag/bricka-misslyckad.png";
  String start = "assets/data/nollning_25/uppdrag/bricka-start.png";
  String rubrik = "assets/data/nollning_25/uppdrag/rubrik.png";

  @override
  void initState() {
    super.initState();
    _loadInitData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadInitData() async {
    final nollningResponse = await ApiService.apiClient
        .getNollningApi()
        .nollningGetNollningByYear(year: DateTime.now().year);
    final nollningData = nollningResponse.data;

    if (nollningData != null) {
      List<NollningGroupRead> mentorGroups = nollningData.nollningGroups
          .where((group) => group.group.groupType.name == "mentor")
          .toList();
      for (final nollningGroup in mentorGroups) {
        final groupMissions = await ApiService.apiClient
            .getNollningApi()
            .nollningGetGroupMissionsFromNollningGroup(
              nollningGroupId: nollningGroup.id,
            );

        int totalPoints = 0;
        if (groupMissions.data != null && groupMissions.data!.isNotEmpty) {
          for (final gm in groupMissions.data!.toList()) {
            if (gm.isAccepted == "Accepted") {
              totalPoints += gm.points;
            }
          }
        }
        groupPointsMap[nollningGroup] = totalPoints;
      }
    }

    setState(() {
      this.nollning = nollningData;
    });
  }

  List<Widget> _createHighscoreCards(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    List<Widget> highscoreCards = [];

    Map<NollningGroupRead, int> sortedMap = Map.fromEntries(
      groupPointsMap.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    int pos = 1;

    sortedMap.forEach((key, value) {
      highscoreCards.add(highscoreCard(key, value, pos, context));
      pos++;
    });

    return highscoreCards;
  }

  Widget highscoreCard(
    NollningGroupRead group,
    int points,
    int position,
    BuildContext context,
  ) {
    var t = AppLocalizations.of(context)!;
    return Center(
      child: Container(
        height: widget.availableHeight / 15,
        width: widget.availableWidth - 40,
        child: Card(
          shadowColor: Colors.transparent,
          color: Colors.transparent,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      position.toString(),
                      style: TextStyle(
                        color: _getPositionColor(position),
                        fontFamily: "LoRes12OT",
                        fontWeight: FontWeight.w800,
                        fontSize: widget.availableWidth / 15,
                      ),
                    ),
                  ),
                  Container(
                    width: widget.availableWidth / 3,
                    height: widget.availableHeight / 10,
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        group.group.name.length <= 40
                            ? group.group.name
                            : group.group.name.substring(0, 20) + "...",
                        style: TextStyle(
                          fontFamily: "LoRes12OT",
                          fontWeight: FontWeight.w600,
                          fontSize: group.group.name.length <= 10
                              ? widget.availableWidth / 15
                              : (group.group.name.length <= 20
                                    ? widget.availableWidth / 15
                                    : widget.availableWidth / 30),
                          color: _getPositionColor(position),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      _pointsToString(points),
                      style: TextStyle(
                        fontFamily: "LoRes12OT",
                        fontWeight: FontWeight.normal,
                        fontSize: widget.availableWidth / 15,
                        color: _getPositionColor(position),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    if (this.nollning == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      height: widget.availableHeight,
      width: widget.availableWidth,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: widget.availableHeight * 0.01),
                  child: Text(
                    "HIGH SCORES",
                    style: TextStyle(
                      fontFamily: "LoRes12OT",
                      fontSize: widget.availableWidth / 10,
                      color: Colors.white, // justera efter din bakgrund
                    ),
                  ),
                ),
                ..._createHighscoreCards(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getPositionColor(int pos) {
    switch (pos % 4) {
      case 0:
        return Colors.indigo;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.pink;
      default:
        return Colors.cyan;
    }
  }

  String _pointsToString(int points) {
    String pointString = points.toString();
    while (pointString.length < 6) {
      pointString = "0" + pointString;
    }
    return pointString;
  }
}
