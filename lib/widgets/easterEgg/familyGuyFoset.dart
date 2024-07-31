import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

const double periodSeconds = 2;
const int refreshIntervalMilliseconds = 10;

class familyGuyFoset extends StatefulWidget {
  _familyGuyFosetState createState() => _familyGuyFosetState();
}

class _familyGuyFosetState extends State<familyGuyFoset>
    with SingleTickerProviderStateMixin {
  double xPos = 0;
  double yPos = 0;
  AnimationController? _controller;
  


  @override
  void initState() {
    super.initState();

  
  AudioPlayer().play(AssetSource('audio/brianRickRoll.mp3'));
  //AudioPlayer().play(AssetSource('audio/glock.mp3'));

  _controller = AnimationController(
    duration: new Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: false);

  }

  @override
  void dispose() {
    if (_controller != null) _controller!.dispose();
    super.dispose();
  }


@override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: (_, __) {
          return Positioned(
              left: 30 + 30 * cos(_controller!.value * 2 * pi),
              top: -500 + 60 * sin(_controller!.value * 2 * pi),
              child: Column(children: [
                Image(
                  image: AssetImage("assets/img/memes/fos24.jpg"),
                  width: 350,
                ),
              ]));
        },
        animation: _controller!);
  }
}






/*
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      builder: (context, child) {
        return Positioned(
          top: -screenHeight,
          left: -30,
          child: Container(
            height: screenHeight,
            width: screenWidth,
            child: 
            Expanded(
              child:
              Image(
                image: AssetImage("assets/img/memes/fos24.jpg"),
              )
            )
          )
        );
      },
      animation: _controller,
    );
  }
}
      */
      
      
  

    