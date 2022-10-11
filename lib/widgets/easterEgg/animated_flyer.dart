import 'dart:math';

import 'package:flutter/widgets.dart';

class AnimatedFlyer extends StatefulWidget {

  _AnimatedFlyerState createState() => _AnimatedFlyerState();
} 

class _AnimatedFlyerState extends State<AnimatedFlyer> {
  double xPos = 0;
  double yPos = 0;
  
  void animate() async{
    print("Hej");
    setState(() {
      xPos = 50* sin(DateTime.now().second*2*pi);
    });
    await Future.delayed(new Duration(seconds: 1));
    animate();
  } 
  
  @override
  void initState() {
    animate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: new Duration(seconds: 1),
      left: xPos,
      top: yPos,
      child: Text("Ooga booga")
    );
  }
} 