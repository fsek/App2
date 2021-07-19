import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NollningPage extends StatefulWidget {
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
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/adventure_missions');
                  },
                  child: Icon(Icons
                      .emoji_events_rounded), // Change to better mission icon
                ),
                FloatingActionButton(
                  onPressed: () => null,
                ),
                FloatingActionButton(
                  onPressed: () => null,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => null,
                ),
                FloatingActionButton(
                  onPressed: () => null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
