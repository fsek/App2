import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';

import 'package:fsek_mobile/screens/cafe/cafe.dart';
import 'package:fsek_mobile/screens/gallery/gallery.dart';
import 'package:fsek_mobile/screens/guild_meeting/candidacy_poster.dart';
import 'package:fsek_mobile/screens/guild_meeting/other_documents.dart';
import 'package:fsek_mobile/screens/guild_meeting/about_guild_meeting.dart';
import 'package:fsek_mobile/screens/guild_meeting/propositions.dart';
import 'package:fsek_mobile/screens/guild_meeting/motions.dart';
import 'package:fsek_mobile/screens/games/moose_game/moose_game.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:fsek_mobile/models/documents/election_document.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/services/theme.service.dart';

import 'package:fsek_mobile/services/service_locator.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

// During introduction, please don't modify this file.
// Instead, create a new file in the home folder, for example nollningHome25.dart
// And change the destination in main.dart

class _HomePageState extends State<HomePage> {
  List<ElectionDocument>? backgroundDocuments;
  String? backgroundUrl;
  bool? election;

  void initState() {
    // This should probably be commented out at least until we get it working properly
    // locator<DocumentService>().getOthers("Bakgrund").then((value) => setState(() {
    //   // Value is null if getothers parameter doesnt exist, empty list if it exists but no documents in it.
    //   if (!listEquals(value, []) && value != null) {
    //     this.backgroundDocuments = value;
    //     // title cant be empty so it is always a string
    //     if (value.last.document_name!.toLowerCase().startsWith("ht") || value.last.document_name!.toLowerCase().startsWith("vt")) {
    //       // if the pictured background is named ht or vt means we are in ht or vt and should use that button layout
    //       this.election = true;
    //     } else {
    //       this.election = false;
    //     }
    //     this.backgroundUrl = value.last.url;
    //   }
    // }));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowStilIDPopup());
  }

  Future<void> _maybeShowStilIDPopup() async {
    var t = AppLocalizations.of(context)!;
    AdminUserRead? userData;
    final errorLookup = {
      "empty": t.stilIdNotificationErrorEmpty,
      "fail": t.stilIdNotificationErrorInvalid
    };

    try{
      final response = await ApiService.apiClient.getUsersApi().usersGetMe();
      userData = response.data;
    } catch(e) {
      return;
    }

    final shouldShow = userData != null && userData.stilId == null;
    if (!mounted || !shouldShow) return;

    TextEditingController _textFieldController = TextEditingController();
    bool loading = false;
    String? errorCode;
    bool triedToCheat = false;

    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext dialogContext) =>
            StatefulBuilder(builder: (context, setDialogState) =>
                PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) {
                    if(didPop) return;
                    setDialogState(() => triedToCheat = true);
                  },
                  child: AlertDialog(
                    title: Text(t.stilIdNotificationTitle),
                    contentPadding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          t.stilIdNotificationInfo,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Visibility(
                          visible: triedToCheat,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Text(
                              t.stilIdNotificationNiceTry,
                              style: const TextStyle(color: Colors.red, fontSize: 13)
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: _textFieldController,
                          enabled: !loading,
                          decoration: InputDecoration(
                            hintText: "ab0000cd-s",
                            errorText: errorLookup[errorCode],
                            errorMaxLines: 2
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                            content: Text(t.stilIdNotificationWhy),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }, icon: const Icon(Icons.info_outline,)),
                      TextButton(
                          onPressed: loading ? null : () async {
                            setDialogState(() {
                              loading = true;
                              errorCode = null;
                            });
                            final result = await _tryAddStilId(_textFieldController.text.trim());
                            if (result.$1) {
                              if(dialogContext.mounted){
                                Navigator.of(dialogContext).pop();
                              }
                              return;
                            }
                            if(dialogContext.mounted){
                              setDialogState(() {
                                loading = false;
                                errorCode = result.$2!;
                              });
                            }
                          },
                          child: loading ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.black),
                          ) : Text(t.stilIdNotificationSubmit)
                      )
                    ],
                  ),
                )
            )
    );
  }

  Future<(bool, String?)> _tryAddStilId(String input) async {
    if (input.isEmpty) {
      return (false, "empty");
    }

    try {
      await ApiService.apiClient.getUsersApi().usersUpdateSelf(
        userUpdate: UserUpdate((b) => b..stilId = input),
      );
      return (true, null);
    }
    catch (e) {
      return (false, "fail");
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    double edgePadding = MediaQuery.of(context).size.width / 25;
    String defaultBackground = "assets/img/default_background.png";

    return Stack(children: [
      // If we couldn't get a background image for whatever reason make it the default
      backgroundUrl != null
          ? CachedNetworkImage(
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        placeholder: (context, url) => Center(child: CircularProgressIndicator(color: locator<ThemeService>().theme.primaryColor)),
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
                  // check thar election bool isnt null and if it is true make the home design according to electionbuttons.
                  // if null or false just use standard buttons, null means that there wasnt any picture on website
                  children: this.election != null
                      ? (this.election! ? _getElectionButtons() : _getStandardButtons())
                      : _getStandardButtons(),
                )
            )
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
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadowColor: Theme.of(context).colorScheme.onBackground,
          elevation: 10,
          minimumSize: Size(MediaQuery.of(context).size.width / 2.4, 80)),
    );
  }

  List<Widget> _getStandardButtons() {
    // This returns the buttons that are used for the standard design of the homepage
    var t = AppLocalizations.of(context)!;
    return [
      Spacer(flex: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          button(t.songbookSongbook, SongbookPage()),
          button(t.otherGallery, GalleryPage()),
        ],
      ),
      Spacer(flex: 2),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          button(t.otherCafe, CafePage()),
          button(t.game, MooseGamePage()),
        ],
      ),
      Spacer(flex: 4)
    ];
  }

  List<Widget> _getElectionButtons() {
    var t = AppLocalizations.of(context)!;

    return [
      Spacer(flex: 6),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          SizedBox(width: MediaQuery.of(context).size.width / 48), // space so that the fifth button matches up with the grid above
          button(t.guildMeetingButtonOther, OtherDocumentsPage()),
        ],
      ),
      Spacer(flex: 2),
    ];
  }
}