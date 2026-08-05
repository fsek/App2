import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/nollning/nolleguide_26/infoContent.dart';

class InfoScreen extends StatelessWidget {
  static const backgroundPath = "assets/data/nollning_26/nolleguide/infobg.png";
  
  final List<ContentBlock> blocks;
  final double boxWidthFrac;
  final double boxHeightFrac;
  
  const InfoScreen({
    super.key,
    required this.blocks,
    this.boxWidthFrac = 0.7,
    this.boxHeightFrac = 0.55
});
  
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final boxWidth = screenWidth * this.boxWidthFrac;
    final boxHeight = screenHeight * this.boxHeightFrac;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: new Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Transform.scale(scale: 1.2, child:Image.asset(backgroundPath, fit: BoxFit.cover))
          ),
          
          SafeArea(
              child: Align(
                alignment: const Alignment(0.0, -0.3),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: boxWidth,
                      height: boxHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          //color: Colors.white,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: blocks.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: blocks[index].build(context),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                )
              )
          )
        ],
      ),
    );
  }
}