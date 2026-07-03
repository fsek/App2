import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/nollning/week_tracker.dart';

class ScheduleScreenPage extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreenPage> {
  var state = WeekTracker.determineWeek();
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t =  AppLocalizations.of(context)!;

    var screen_width = MediaQuery.of(context).size.width;
    var screen_height = MediaQuery.of(context).size.height;

    const img_width = 2718;
    const img_height = 22622;
    final double render_image_width = screen_width * 1.02; // Magic number because the schema image's border looks a bit wierd so we make it a bit wider to not include the edges.
    final double render_image_height = render_image_width * (img_height / img_width);

    final schema_Path = "assets/data/nollning_26/schema/schema_${t.localeName}.png";

    // var state = WeekTracker.determineWeek();
    // var state = 0;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          var sensitivity = 100;
          if (details.primaryVelocity! > sensitivity) {
            // Swipe down
            if (state != 4) {
              setState(() { state++; });
            }
          } else if (details.primaryVelocity! < -sensitivity) {
            // Swipe up
            if (state != 0) {
              setState(() { state--; });
            }
          }
        },
        child: Stack(
          children: [
            AnimatedPositioned(
              width: screen_width,
              height: render_image_height,
              top: screenPosition(render_image_height, state),
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: ClipRect(
                child: OverflowBox(
                  maxWidth: render_image_width,
                  minWidth: render_image_width,
                  maxHeight: render_image_height,
                  minHeight: render_image_height,
                  alignment: const Alignment(1, 0),
                  child: Image.asset(
                    schema_Path,
                    fit: BoxFit.fill,
                    cacheHeight: 10000,
                    cacheWidth: 1000,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static double screenPosition(double render_image_height, int state){
    switch(state){
      case 0:
        return -render_image_height * 0.78;
      case 1:
        return -render_image_height * 0.6;
      case 2:
        return -render_image_height * 0.4;
      case 3:
        return -render_image_height * 0.19;
      case 4:
        return -render_image_height * 0.01;
      default:
        throw new InvalidInputException("Unexpected state: " + state.toString());
    }
  }
}