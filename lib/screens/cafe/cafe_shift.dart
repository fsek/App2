import 'package:flutter/material.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/util/time.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';

class CafeShiftPage extends StatefulWidget {
  final int shiftId;
  final SimpleUserRead? cafeUser;
  CafeShiftPage({Key? key, required this.shiftId, required this.cafeUser})
      : super(key: key);
  @override
  _CafeShiftPageState createState() => _CafeShiftPageState();
}

class _CafeShiftPageState extends State<CafeShiftPage> {
  CafeShiftRead? shift;
  SimpleUserRead? cafeUser;
  AdminUserRead? me;

  void initState() {
    cafeUser = widget.cafeUser;
    _update();
    super.initState();
  }

  Future<void> _update() async {
    final cafeResponse = await ApiService.apiClient
        .getCafeApi()
        .cafeViewShift(shiftId: widget.shiftId);
    final cafeResponseData = cafeResponse.data;

    final meResponse = await ApiService.apiClient.getUsersApi().usersGetMe();
    final meResponseData = meResponse.data;

    setState(() {
      this.shift = cafeResponseData;
      this.me = meResponseData;
    });
  }

  void signup(CafeShiftRead shift) async {
    await ApiService.apiClient
        .getCafeApi()
        .cafeSignupToShift(shiftId: shift.id)
        .then((response) => successSignup(), onError: (e) => failSignup());
    _update();
  }

  void unsign(CafeShiftRead shift) async {
    // Dont think we need this anymore?: user = null; // bcuz garbage api lul
    await ApiService.apiClient
        .getCafeApi()
        .cafeSignoffFromShift(shiftId: shift.id)
        .then((response) => successUnsign(), onError: (e) => failUnsign());
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
    var t = AppLocalizations.of(context)!;
    return generalPopup(t.cafeShiftSignup, t.cafeShiftSignupText);
  }

  Future<void> failSignup() {
    var t = AppLocalizations.of(context)!;
    return generalPopup(t.cafeShiftFail, t.cafeShiftFailSignupText);
  }

  Future<void> successUnsign() {
    var t = AppLocalizations.of(context)!;
    return generalPopup(t.cafeShiftSuccessUnsign, t.cafeShiftSuccessUnsignText);
  }

  Future<void> failUnsign() {
    var t = AppLocalizations.of(context)!;
    return generalPopup(t.cafeShiftFail, t.cafeShiftFailUnsignText);
  }

  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    if (shift == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.cafeShiftCafeShift),
        ),
      );
    }

    // Different text if user is already signed up to shift
    // also different button for signup/unsignup
    String headerText = "";
    TextButton? signupButton;
    if (shift!.userId == me!.id) {
      headerText = t.cafeShiftSignedUp;
      signupButton = TextButton(
        onPressed: () => unsign(shift!),
        child: Text(
          t.cafeShiftRemoveSignup,
          style: TextStyle(
              fontSize: 32, color: Theme.of(context).colorScheme.onError),
        ),
        style: ButtonStyle(
          fixedSize: WidgetStateProperty.all(Size(300, 75)),
          backgroundColor:
              WidgetStateProperty.all(Theme.of(context).colorScheme.error),
        ),
      );
    } else {
      // if someone else is on the shift, or if it is an empty shift
      headerText = (cafeUser == null)
          ? t.cafeShiftSignup2
          : "${cafeUser!.firstName} ${cafeUser!.lastName}\n${t.cafeShiftIsSignedUp} ";
      signupButton = (cafeUser == null)
          ? TextButton(
              onPressed: () => signup(shift!),
              child: Text(t.cafeShiftSignMeUp, style: TextStyle(fontSize: 32)),
              style: ButtonStyle(
                backgroundColor:
                    Theme.of(context).textButtonTheme.style!.backgroundColor,
                fixedSize: WidgetStateProperty.all(Size(300, 75)),
              ),
            )
          : null; // if another person is on the shift, don't show a signup button
    }
    headerText +=
        "${t.cafeShiftForShift}\n${Time.format(shift!.startsAt, "%D")}${t.cafeShiftClock}${dateTimeToHourAndMinute(shift!.startsAt)}";
    return Scaffold(
      appBar: AppBar(
        title: Text(t.cafeShiftCafeShift),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              headerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                decorationColor: Theme.of(context).colorScheme.primary,
                decorationThickness: 1.3,
              ),
            ),
            SizedBox(height: 100),
            if (signupButton != null) signupButton,
          ],
        ),
      ),
    );
  }
}

String dateTimeToHourAndMinute(DateTime date) {
    return "${date.hour}:${date.minute}";
  }