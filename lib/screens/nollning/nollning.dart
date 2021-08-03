import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions.dart';

class NollningPage extends StatefulWidget {
  static const routeName = '/nollningpage';

  @override
  _NollningPageState createState() => _NollningPageState();
}

class _NollningPageState extends State<NollningPage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nollning 2021"),
      ),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => null,
        icon: Icon(Icons.phone_rounded),
        label: Text("Nolleakuten"),
        backgroundColor: Colors.redAccent,
        heroTag: "emergency_tag",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(context, AdventureMissionsPage.routeName);
                  },
                  // Change to better mission icon
                  icon: Icon(Icons.emoji_events_rounded),
                  label: Text("Uppdrag"),
                  heroTag: "adventure_missions_tag",
                ),
                FloatingActionButton.extended(
                  onPressed: () => null,
                  icon: Icon(Icons.message_rounded),
                  label: Text("Meddelanden"),
                  heroTag: "messages_tag",
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                  onPressed: () => null,
                  icon: Icon(Icons.calendar_today_rounded),
                  label: Text("Tidslinje"),
                  heroTag: "timeline_tag",
                ),
                FloatingActionButton.extended(
                  onPressed: () => null,
                  icon: Icon(Icons.queue_music_rounded),
                  label: Text("Sångbok"),
                  heroTag: "songbook_tag",
                ),
              ],
            ),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
