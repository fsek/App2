import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:fsek_mobile/util/authentication/authentication_bloc.dart';
import 'package:fsek_mobile/util/authentication/login_bloc.dart';

import 'login_ui.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.userService}) : super(key: key);

  final UserService? userService;

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _loginBloc;
  UserService? _userService;
  //ignore: close_sinks
  AuthenticationBloc? _authenticationBloc;

  String buildName = "x.x.x";

  @override
  void initState() {
    _userService = widget.userService;
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(authenticationBloc: _authenticationBloc!, userService: _userService!);

    if (!kIsWeb) {
      PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
        setState(() {
          buildName = packageInfo.version;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _versionText = Text("F-appen Version: " + buildName, style: Theme.of(context).textTheme.bodyLarge);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [_versionText]),
              SizedBox(
                height: 12,
              )
            ],
          ),
          SingleChildScrollView(
              child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
                    LoginUI(
                      authenticationBloc: _authenticationBloc,
                      loginBloc: _loginBloc,
                      userService: _userService,
                    )
                  ]))),
        ]));
  }

  @override
  void dispose() {
    _loginBloc!.close();
    super.dispose();
  }
}
