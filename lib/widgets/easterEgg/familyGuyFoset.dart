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
  late AnimationController _controller;
  late Animation<double> _animation;
  


  @override
  void initState() {
    super.initState();

  AudioPlayer().play(AssetSource('audio/brianRickRoll.mp3'));
  //AudioPlayer().play(AssetSource('audio/glock.mp3'));

  _controller = AnimationController(
    duration: new Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: false);


  _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

  _controller.forward();
  }

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
      
      
      
      
      
      /*
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: 1.0 - _animation.value,
              child: Transform.scale(
                scale: _animation.value,
                child: child,
              ),
            );
          },
          child: Image.asset("assets/img/memes/fos24.jpg"),
        ),
      ),
    );
  }
}*/

    