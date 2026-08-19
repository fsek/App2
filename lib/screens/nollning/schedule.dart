import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/screens/nollning/englishSchedule.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/nollning/week_tracker.dart';

class ScheduleScreenPage extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreenPage> {
  var state = -1;
  var image_loaded = false;

  @override
  void initState(){
    super.initState();
    // hide the android navigation bar while the schedule is showing
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // before leaving, show the android navigation bar again
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t =  AppLocalizations.of(context)!;

    switch(t.localeName){
      case "sv":
        return _swedishSchema(context);
      case "en":
        return EnglishSchedulePage();
      default:
        throw new InvalidInputException("Invalid locale: ${t.localeName}");
    }
  }

  Widget _swedishSchema(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    var screen_height = MediaQuery.of(context).size.height;

    const img_width = 1581;
    const img_height = 22108;
    final double render_image_width = screen_width * 1.03; // Magic number because the schema image's border looks a bit wierd so we make it a bit wider to not include the edges.
    final double render_image_height = render_image_width * (img_height / img_width);

    final schema_Path = "assets/data/nollning_26/schema/schema_sv.png";

    return Scaffold(
      backgroundColor: new Color.fromRGBO(134, 187, 230, 1),
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
              top: _screenPosition(render_image_height, state),
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: ClipRect(
                child: OverflowBox(
                  maxWidth: render_image_width,
                  minWidth: render_image_width,
                  maxHeight: render_image_height,
                  minHeight: render_image_height,
                  child: Image.asset(
                    schema_Path,
                    fit: BoxFit.fill,
                    cacheHeight: 5000,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded || frame != null) {
                        if (!image_loaded) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted) {
                              var week = WeekTracker.determineWeek();
                              setState(() {
                                image_loaded = true;
                                state = week;
                              });
                            }
                          });
                        }
                        return child;
                      }
                      return const SizedBox.shrink(); // invisible while loading
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static double _screenPosition(double render_image_height, int state){
    switch(state){
      case -1: // Image not loaded
        return -render_image_height;
      case 0: // Week 0
        return -render_image_height * 0.847;
      case 1: // Week 1
        return -render_image_height * 0.64;
      case 2: // Week 2
        return -render_image_height * 0.43;
      case 3: // Week 3
        return -render_image_height * 0.23;
      case 4: // Week 4
        return -1;
      default:
        throw new InvalidInputException("Unexpected state: " + state.toString());
    }
  }
}