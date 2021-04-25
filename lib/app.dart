import 'dart:async';

import 'package:fsek_mobile/screens/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/content_wrapper.dart';
import 'package:fsek_mobile/util/PushNotificationsManager.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/storage_wrapper.dart';
import 'package:fsek_mobile/widgets/loading_widget.dart';

import 'screens/login/login.dart';

import 'models/destination.dart';
import 'models/user/user.dart';

import 'services/home.service.dart';
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
  PushNotificationsManager pushManager;
  AuthenticationBloc _authenticationBloc;
  UserService _userService;
  TokenStorageWrapper _storage;
  StreamController _onNavigation;
  int backgroundIndex = 1;

  User _user;

  @override
  void initState() {
    setupLocator();
    _storage = locator<TokenStorageWrapper>();
    _userService = locator<UserService>();
    _userService.clearToken();
    _authenticationBloc = AuthenticationBloc(userService: _userService);
    _authenticationBloc.add(AppStarted());
    _authenticationBloc.listen((AuthenticationState state) async {
      if (state is AuthenticationUserFetched) {
        setState(() {
          this._user = UserService.user;
        });
        /*locator<HomeService>().getHomeData()
          .then((value) => setState(() => _homeData = value))
          .catchError(onDataError);

        locator<HomeService>().getFlatDepartments()
          .then((value) => setState(() => _departments = value))
          .catchError(onDataError);
*/
        //setupPushNotifications();
      }
    });

    _onNavigation = StreamController<Type>.broadcast();
    super.initState();
  }

  void onDataError(dynamic error) {
    if (error is UnauthorisedException)
      _authenticationBloc.add(TokenRevoked());
    else
      _authenticationBloc.add(AppError(error: error.toString()));
  }

  void setupPushNotifications() async {
    var firstTime = await _storage.read(key: "first_time");
    pushManager = new PushNotificationsManager();
    if (!kIsWeb) await pushManager.init();

    if (firstTime == null || firstTime == "true") {
      _storage.write(key: "first_time", value: false);
      try {
        String token = await pushManager.getToken();
        locator<NotificationsService>().acceptNotifications(token).then(
          (success) => print("Notifications accept: " + success.toString()));
      } catch(ex) {
        print(ex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Destination> navbarDestinations = <Destination>[
      Destination(0, 'Home', Icons.home,
        HomePage(updateDataStream: _onNavigation.stream)),
      Destination(1, 'Calendar', Icons.calendar_today, 
        HomePage(updateDataStream: _onNavigation.stream)),
      Destination(2, 'Notifications', Icons.notifications, 
        HomePage(updateDataStream: _onNavigation.stream)),
      Destination(3, 'Other', Icons.list, 
        HomePage(updateDataStream: _onNavigation.stream)),
    ];

    // Change background listener
    _onNavigation.stream.listen((event) {
      for (int i = 0; i < navbarDestinations.length; i++) {
        if (navbarDestinations[i].widget.runtimeType == event) {
          setState(() {
            backgroundIndex = i + 1;
          });
          break;
        }
      }
    });

    return BlocProvider<AuthenticationBloc>(
      create: (context) => _authenticationBloc,
      child: MaterialApp(
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.orange,
        ),
        home: Stack(children: [
          BlocConsumer<AuthenticationBloc, AuthenticationState>(
            bloc: _authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: _buildPage(context, state, navbarDestinations),
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
                        "We could not connect to F-sektionen. Please check your connection or try again later.")));
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
          //'/settings': (context) => SettingsPage()
        },
      ));
  }

  Widget _buildPage(BuildContext context, AuthenticationState state,
      List<Destination> navbarDestinations) {
    if (state is AuthenticationUninitialized) {
      return LoadingWidget();
    }
    if (state is AuthenticationAuthenticated) {
      return ContentWrapper(navbarDestinations, null, _onNavigation, []);
    }
    if (state is AuthenticationTokenRefreshed) {
      return ContentWrapper(
        navbarDestinations, _user, _onNavigation, []);
    }
    if (state is AuthenticationUserFetched) {
      return ContentWrapper(
        navbarDestinations, _user, _onNavigation, state.messages);
    }
    if (state is AuthenticationUnauthenticated) {
      return LoginPage(userService: _userService);
    }
    if (state is AuthenticationLoading) {
      return LoadingWidget();
    }
    return null;
  }

  @override
  void dispose() {
    _authenticationBloc.close();
    _onNavigation.close();
    super.dispose();
  }
}
