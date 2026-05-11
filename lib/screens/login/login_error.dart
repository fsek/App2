import 'package:flutter/material.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/services/navigation.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/util/authentication/authentication_bloc.dart';
import 'package:fsek_mobile/util/authentication/authentication_event.dart';

class LoginError extends StatefulWidget {
  LoginError({Key? key, this.text, this.authenticationBloc}) : super(key: key);

  final String? text;
  final AuthenticationBloc? authenticationBloc;

  @override
  _LoginErrorPageState createState() => _LoginErrorPageState();
}

class _LoginErrorPageState extends State<LoginError> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Material(
        child: Stack(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Oops!",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(
                  height: 6,
                ),
                Text(t!.loginWrongEmailOrPassword),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  child:
                      Text(t!.loginTryAgain, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                  style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    locator<NavigationService>().pop();
                    widget.authenticationBloc!.add(AppStarted());
                  },

                ),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(onTap: () {
                  setState(() {
                    if(isVisible) isVisible = false;
                    else isVisible = true;
                  });
                }, child: Text(isVisible ? t!.loginHideError : t!.loginShowError, style: TextStyle(color: Colors.blue), )),
                if(isVisible) ...[
                  SizedBox(height: 16),
                  Text(
                    widget.text!,
                    style: TextStyle(fontSize: 10),
                  ),
                ]
              ],
            ))
      ],
    ));
  }
}
