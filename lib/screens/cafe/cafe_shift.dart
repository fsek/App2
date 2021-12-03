import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/cafe/cafe_shift.dart';
import 'package:fsek_mobile/services/cafe.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';

class CafeShiftPage extends StatefulWidget {
  final int shiftId;
  CafeShiftPage({Key? key, required this.shiftId}) : super(key: key);
  @override
  _CafeShiftPageState createState() => _CafeShiftPageState();
}

class _CafeShiftPageState extends State<CafeShiftPage> {
  CafeShift? shift;

  void initState() {
    _update();
    super.initState();
  }

  Future<void> _update() async {
    locator<CafeService>().getShift(widget.shiftId).then((value) => setState(() {
          this.shift = value;
        }));
  }

  void signup(CafeShift shift) async {
    await locator<CafeService>().cafeShiftSignup(shift).then((value) => successSignup(), onError: (e) => failSignup());
    _update();
  }

  void unsign(CafeShift shift) async {
    await locator<CafeService>().cafeShiftUnsign(shift).then((value) => successUnsign(), onError: (e) => failUnsign());
    _update();
  }

  Future<void> generalPopup(String title, String body) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<void> successSignup() {
    return generalPopup("Du är nu uppskriven på passet!", "Tack för att du vill jobba i caféet! Kom ihåg att avanmäla dig om du får förhinder.");
  }

  Future<void> failSignup() {
    return generalPopup("Något gick fel!", "Du kanske redan är anmäld på ett pass vid samma tid?");
  }

  Future<void> successUnsign() {
    return generalPopup("Du är nu avanmäld från passet!", "Tipsa en kompis om att anmäla sig på passet istället!");
  }

  Future<void> failUnsign() {
    return generalPopup("Något gick fel!", "Det gick inte att avanmäla dig från passet.");
  }

  Widget build(BuildContext context) {
    if (shift == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cafépass'),
        ),
      );
    }

    // Different text if user is already signed up to shift
    // also different button for signup/unsignup
    String headerText = "";
    TextButton? signupButton;
    if (shift!.isme == null) {
      headerText = "${shift!.user} är anmäld ";
    } else if (shift!.isme!) {
      headerText = "Du är anmäld ";
      signupButton = TextButton(
        onPressed: () => unsign(shift!),
        child: Text("Avanmäl mig :(("),
      );
    } else {
      headerText = "Anmälan ";
      signupButton = TextButton(
        onPressed: () => signup(shift!),
        child: Text("Anmäl mig :))"),
      );
    }
    headerText += "till pass kl ${shift!.duration}";
/*
          (shift!.isme != null) ?
          (shift!.isme!)
              ? TextButton(
                  onPressed: () => unsign(shift!),
                  child: Text("Avanmäl mig :(("),
                )
              : TextButton(
                  onPressed: () => signup(shift!),
                  child: Text("Anmäl mig :))"),
                ) : 
                */
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafépass'),
      ),
      body: Column(
        children: [
          Text(headerText),
          if (signupButton != null) signupButton,
        ],
      ),
    );
  }
}
