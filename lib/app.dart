import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/content_wrapper.dart';
import 'package:fsek_mobile/screens/nollning/adventure_missions.dart';
import 'package:fsek_mobile/screens/nollning/emergency_contacts.dart';
import 'package:fsek_mobile/screens/nollning/nollning.dart';
import 'package:fsek_mobile/services/theme.service.dart';
import 'package:fsek_mobile/util/PushNotificationsManager.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/storage_wrapper.dart';
import 'package:fsek_mobile/widgets/loading_widget.dart';

import 'app_background.dart';
import 'screens/login/login.dart';

import 'models/destination.dart';
import 'models/user/user.dart';

import 'services/navigation.service.dart';
import 'services/notifications.service.dart';
import 'services/service_locator.dart';
import 'services/user.service.dart';
import 'util/authentication/authentication_bloc.dart';
import 'util/authentication/authentication_event.dart';
import 'util/authentication/authentication_state.dart';
import 'util/errors/error_page.dart';

class FsekMobileApp extends StatefulWidget {
  @override
  _FsekMobileAppState createState() => _FsekMobileAppState();
}

class _FsekMobileAppState extends State<FsekMobileApp> {
  PushNotificationsManager? pushManager;
  AuthenticationBloc? _authenticationBloc;
  UserService? _userService;
  TokenStorageWrapper? _storage;
  int backgroundIndex = 1;

  User? _user;

  List<Destination> navbarDestinations = [];

  @override
  void initState() {
    _userService = locator<UserService>();
    //checkApiVersion();
    _storage = locator<TokenStorageWrapper>();
    _authenticationBloc = AuthenticationBloc(userService: _userService!);
    _authenticationBloc!.add(AppStarted());
    _authenticationBloc!.stream.listen((AuthenticationState state) async {
      if (state is AuthenticationUserFetched) {
        setState(() {
          this._user = UserService.user;
        });

        setupPushNotifications();
      }
    });
    // Change background listener
    locator<NavigationService>().onNavigation.stream.listen((event) {
      for (int i = 0;
          i < locator<NavigationService>().navbarDestinations.length;
          i++) {
        if (locator<NavigationService>()
                .navbarDestinations[i]
                .widget
                .runtimeType ==
            event) {
          setState(() {
            backgroundIndex = i + 1;
          });
          break;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
        create: (context) => _authenticationBloc!,
        child: MaterialApp(
          navigatorKey: locator<NavigationService>().navigatorKey,
          theme: locator<ThemeService>().theme,
          home: Stack(children: [
            AppBackground(
                backgroundColors: locator<ThemeService>().backgroundColors),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              bloc: _authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: _buildPage(context, state,
                      locator<NavigationService>().navbarDestinations),
                );
              },
              listener: (context, state) {
                if (state is AuthenticationDisconnected) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ErrorPage(
                              authenticationBloc: _authenticationBloc,
                              text:
                                  "We could not connect to Purplepoint. Please check your connection or try again later.")));
                }
                if (state is AuthenticationError) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ErrorPage(
                              authenticationBloc: _authenticationBloc,
                              text: state.error)));
                }

                // Background-animation stuff
                if (state is! AuthenticationUserFetched &&
                    state is! AuthenticationAuthenticated) {
                  setState(() {
                    backgroundIndex = 0;
                  });
                } else {
                  setState(() {
                    backgroundIndex = 1;
                  });
                }
              },
            )
          ]),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // put named routes here plz
            '/nollningpage': (context) => NollningPage(),
            '/adventure_missions': (context) => AdventureMissionsPage(),
            '/emergency_contacts': (context) => EmergencyContactsPage(),
          }..addAll(locator<NavigationService>().routes),
        ));
  }

  Widget? _buildPage(BuildContext context, AuthenticationState state,
      List<Destination> navbarDestinations) {
    if (state is AuthenticationUninitialized) {
      return LoadingWidget();
    }
    if (state is AuthenticationAuthenticated) {
      return ContentWrapper(navbarDestinations, null,
          locator<NavigationService>().onNavigation, []);
    }
    if (state is AuthenticationTokenRefreshed) {
      return ContentWrapper(navbarDestinations, _user,
          locator<NavigationService>().onNavigation, []);
    }
    if (state is AuthenticationUserFetched) {
      return ContentWrapper(navbarDestinations, _user,
          locator<NavigationService>().onNavigation, state.messages);
    }
    if (state is AuthenticationUnauthenticated) {
      return LoginPage(userService: _userService);
    }
    if (state is AuthenticationLoading) {
      return LoadingWidget();
    }
    return null;
  }

  void onDataError(dynamic error) {
    if (error is UnauthorisedException)
      _authenticationBloc!.add(TokenRevoked());
    else
      _authenticationBloc!.add(AppError(error: error.toString()));
  }

  void setupPushNotifications() async {
    var firstTime = await _storage!.read("first_time");
    pushManager = PushNotificationsManager();
    if (!kIsWeb) await pushManager!.init();

    if (firstTime == null || firstTime == "true") {
      _storage!.write(key: "first_time", value: false);
      try {
        String token = await pushManager!.getToken();
        locator<NotificationsService>().acceptNotifications(token).then(
            (success) => print("Notifications accept: " + success.toString()));
      } catch (ex) {
        print(ex);
      }
    }
  }

  /*void checkApiVersion() {
    _userService!.isGoodApiVersion().then((value) {
      if(!value) {
        showDialog<void>(
          context: locator<NavigationService>().navigatorKey.currentState!.overlay!.context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Old app version'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('This version of the app uses an old API version.'),
                    Text('It is recommended that you update your app.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }*/

  @override
  void dispose() {
    _authenticationBloc!.close();
    super.dispose();
  }
}
