import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/guild_meeting/candidacy_poster.dart';
import 'package:fsek_mobile/screens/guild_meeting/other_documents.dart';
import 'package:fsek_mobile/screens/guild_meeting/about_guild_meeting.dart';
import 'package:fsek_mobile/screens/guild_meeting/propositions.dart';
import 'package:fsek_mobile/screens/guild_meeting/motions.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/screens/guild_meeting/proposition_card.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/document.service.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ElectionDocument>? backgroundDocuments;
  String? backgroundUrl;

  void initState() {
    locator<DocumentService>().getOthers("Bakgrund").then((value) => setState(() {
          // Value is null of getothers parameter doesnt exist, empty list if it exists but no documents in it.
          if (!listEquals(value, []) && value != null) {
            this.backgroundDocuments = value;
            this.backgroundUrl = value.last.url;
          }
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    double edgePadding = MediaQuery.of(context).size.width / 25;
    String defaultBackground = "assets/img/default_background.png";

    return Stack(children: [
      // If we couldnt get a background image for whatever reason make it the default
      backgroundUrl != null
          ? CachedNetworkImage(
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: Color(0xFFFB8C00))),
              imageUrl: backgroundUrl!,
            )
          : Image.asset(
              defaultBackground,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              edgePadding, MediaQuery.of(context).size.height / 2.69420 /* lemao */, edgePadding, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // TODO Change the text and function for generic version
                  children: [
                    button(t.guildMeetingButtonAbout, AboutGuildMeetingPage()),
                    button(t.guildMeetingButtonPoster, CandidacyPosterPage()),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button(t.guildMeetingButtonMotions, MotionsPage()),
                    button(t.guildMeetingButtonProposition, PropositionsPage()),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width /
                            48), // space so that the fifth button matches up with the grid above
                    button(t.guildMeetingButtonOther, OtherDocumentsPage()),
                  ],
                ),
                Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget button(String text, Widget destination) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white.withOpacity(1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: Colors.black,
          elevation: 10,
          minimumSize: Size(MediaQuery.of(context).size.width / 2.4, 80)),
    );
  }
}
