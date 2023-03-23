import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutGuildMeetingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    
    return Scaffold(
        appBar: AppBar(
          title: Text(t.guildMeetingTitle),
        ),
        body: Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(t.guildMeetingCurr,
                   style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: t.guildMeetingNominateOne,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: t.guildMeetingNominateTwo,
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://fsektionen.se/val');
                            },
                        ),
                        TextSpan(
                          text: t.guildMeetingSendMotionOne,
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: t.guildMeetingSendMotionTwo,
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:sekreterare@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: " ${t.guildMeetingSendMotionThree}\n\n"
                          "${t.guildMeetingTimePlaceOne}${t.guildMeetingTimePlaceTwo}\n"
                          "${t.guildMeetingTimePlaceThree}\n\n"
                          "${t.guildMeetingDeadlinesOne}:\n"
                          "${t.guildMeetingDeadLinesTwo}\n"
                          "${t.guildMeetingDeadLinesThree}\n"
                          "${t.guildMeetingDeadLinesFour}\n"
                          "${t.guildMeetingDeadLinesFive}\n\n"
                          "${t.guildMeetingETC}",
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: "${t.guildMeetingBoard}",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:styrelsen@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: """.\n\nI sektionens tjänst,\nHanna Areskoug, sekreterare 2023""", //  
                          style: TextStyle(height: 1.5))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("${t.guildMeetingAboutOne}",
                   style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${guildMeetingAboutOne}${guildMeetingAboutTwo}"
                                "${guildMeetingAboutThree}${guildMeetingAboutFour}",
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: "${guildMeetingBoard}}",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:styrelsen@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: "${guildMeetingAboutFive}}",
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: "${guildMeetingAboutSix}}",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://fsektionen.se/kontakter');
                            },
                        ),
                        TextSpan(
                          text: "${guildMeetingAboutSeven}${guildMeetingAboutEight}",
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: "${guildMeetingAboutNine}",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('mailto:sekreterare@fsektionen.se');
                            },
                        ),
                        TextSpan(
                          text: "${t.guildMeetingAboutTen}",
                          style: TextStyle(height: 1.5))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("${t.guildMeetingElectionInfoOne}",
                   style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${t.guildMeetingElectionInfoTwo}",
                          style: TextStyle(height: 1.5)),
                        TextSpan(
                          text: "${t.guildMeetingElectionInfoThree}",
                          style: TextStyle(height: 1.5, color: Colors.orange[600]),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () { launch('https://fsektionen.se/val');
                            },
                        ),
                        TextSpan(
                          text: "${t.guildMeetingElectionInfoFour}${t.guildMeetingElectionInfoFive}"
                          "",
                          style: TextStyle(height: 1.5)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("${t.guildMeetingElectionInfoSix}",
                    style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(
                    height: 8,
                  ),
                  Text("${t.guildMeetingElectionInfoSeven}${t.guildMeetingElectionInfoEight}${guildMeetingElectionInfoNine}",
                   style: TextStyle(height: 1.5)),
                  SizedBox(
                    height: 24,
                  ),
                  Text("${t.guildMeetingBoardElectionOne}",
                   style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(
                    height: 8,
                  ),
                  Text("${t.guildMeetingBoardElectionTwo}${t.guildMeetingBoardElectionTwo}${t.guildMeetingBoardElectionTwo}",
                   style: TextStyle(height: 1.5)),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )));
  }
}
