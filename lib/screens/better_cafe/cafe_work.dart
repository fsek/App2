import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../cafe/cafe.dart';

class CafeWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hilbert Café'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Här finns massa text om hur det är att jobba i caféet. Wow vad kul det är så mycker text!!!!!!! Jobba som nyckelpiga är ju superkul det kan man göra  en gång i veckan och anmäla sig till hä r nedanför. sedan kan man ju ocskå jobba i cafet annars det är ju också kul då måste man inte jobba lika länge men man fär ändå tack och har chans att vinna cafetävlingen, spännande!! \n hahahahaha oj mackor och kaffe :oooooooooo gott gott mums:))))',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              elevation: 1,
              margin: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (((context) => CafePage()))));
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/img/cafe/cafe_work_icon.png",
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 3),
                InkWell(
                  onTap: () {
                    launch("http://contact.fsektionen.se");
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/img/cafe/ladybug_icon.png",
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 5,
                )
              ],
            )
          ]),
        ));
  }
}
