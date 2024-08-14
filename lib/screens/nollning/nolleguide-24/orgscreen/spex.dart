import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpexPage extends StatefulWidget {
  @override
  _SpexScreenState createState() => _SpexScreenState();
}


class _SpexScreenState extends State<SpexPage> {
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context){
  
    String backgroundPaperPath = "assets/img/nollning-24/nolleguide/nolleguide_paper.png";
    String backgroundWoodPath = "assets/img/nollning-24/nolleguide/wood_background.png";
    String i1 = "assets/img/nollning-24/nolleguide/spex/image1.jpg";
    String i2 = "assets/img/nollning-24/nolleguide/spex/image2.jpg";

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var t =  AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: 
      InteractiveViewer(
      panEnabled: true,
      child: 
      SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(backgroundWoodPath),
            Image.asset(backgroundPaperPath),
            Container(
              margin: EdgeInsets.only(top: 100, left: 50, right: 50),
              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        t.spexInLund,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Testament",
                          fontSize: screenWidth/11,
                          color: Color(0xFF540909)
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Text(
                      t.spexContent,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth/28,
                          color: Color(0xFF540909)
                        ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Expanded(child: Image.asset(i1)),
                        SizedBox(width: 10),
                        Expanded(child: Image.asset(i2))
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      t.spexImageText,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth/28,
                        color: Color(0xFF540909)
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        t.spexCredits,
                        style: TextStyle(
                          fontSize: screenWidth/28,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF540909)
                        ),
                      )
                    )
                  ],
            ))
          ],
        )
      ))
    );
  }
}
