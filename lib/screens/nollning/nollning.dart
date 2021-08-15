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
    return Stack(children: [
      Image.asset(
        "assets/img/nollningbakgrundtest.png", //Sizing here is a bit wonky. nollningbakgrundtest is better than original though. Edited in paint so quality is shite
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 2.69420 /* lemao */, 0, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/adventure_missions');
                      },
                      child: Image.asset(
                        "assets/img/Uppdrag.png",
                        height: 100,
                      ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Image.asset(
                        "assets/img/Meddelande.png",
                        height: 100,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/emergency_contacts');
                      },
                      child: Image.asset(
                        "assets/img/information.png",
                        height: 100,
                      ),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: Image.asset(
                        "assets/img/skrikbok.png",
                        height: 100,
                        // scale: 2,
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
