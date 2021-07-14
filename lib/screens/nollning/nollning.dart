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
                  onPressed: () => null,
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
