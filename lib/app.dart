import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsek_mobile/content_wrapper.dart';
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

import 'screens/nollning/adventure_missions.dart';
import 'screens/nollning/emergency_contacts.dart';
import 'package:fsek_mobile/screens/songbook/songbook.dart';
import 'package:fsek_mobile/screens/nollning/chant_book.dart';
import 'package:fsek_mobile/screens/nollning/messaging/messages.dart';

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
  int backgroundIndex = 1;

  User? _user;

  List<Destination> navbarDestinations = [];

  @override
  void initState() {
    _userService = locator<UserService>();
    //checkApiVersion();
    _authenticationBloc = AuthenticationBloc(userService: _userService!);
    _authenticationBloc!.add(AppStarted());
    _authenticationBloc!.stream.listen((AuthenticationState state) async {
      if (state is AuthenticationUserFetched) {
        setState(() {
          _userService!.getUser().then((value) => setState(() {
            this._user = value;

            setupPushNotifications();
          }));
        });
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
            AppBackground(backgroundColors: locator<ThemeService>().backgroundColors),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              bloc: _authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: _buildPage(context, state, locator<NavigationService>().navbarDestinations),
                );
              },
              listener: (context, state) {
                if (state is AuthenticationDisconnected) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorPage(authenticationBloc: _authenticationBloc, text: "We could not connect to Fsektionen.se. Please check your connection or try again later.")));
                }
                if (state is AuthenticationError) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorPage(authenticationBloc: _authenticationBloc, text: state.error)));
                }
              },
            )
          ]),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/adventure_missions': (context) => AdventureMissionsPage(),
            '/emergency_contacts': (context) => EmergencyContactsPage(),
            '/messages': (context) => MessagesPage(),
            '/chant_book': (context) => ChantBookPage(),
            '/song_book': (context) => SongbookPage(),
            '/nollningpage' : (context) => NollningPage(),
          },
        ));
  }

  Widget? _buildPage(BuildContext context, AuthenticationState state, List<Destination> navbarDestinations) {
    if (state is AuthenticationUninitialized) {
      return LoadingWidget();
    }
    if (state is AuthenticationAuthenticated) {
      return ContentWrapper(null, locator<NavigationService>().onNavigation, []);
    }
    if (state is AuthenticationTokenRefreshed) {
      return ContentWrapper(_user, locator<NavigationService>().onNavigation, []);
    }
    if (state is AuthenticationUserFetched) {
      return ContentWrapper(_user, locator<NavigationService>().onNavigation, state.messages);
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
    pushManager = PushNotificationsManager();
    if (!kIsWeb) await pushManager!.init();

    try {
      String token = await pushManager!.getToken();
      locator<NotificationsService>().createPushDevice(token);
      
      String? oldId = await locator<TokenStorageWrapper>().read("notificationId");
      if(oldId == null || oldId != token) {
        User user = await locator<UserService>().getUser();
        if(user.id == null)
          locator<NotificationsService>().deletePushDevice(oldId!);

        locator<TokenStorageWrapper>().write(key: "notificationId", value: token);
      }
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void dispose() {
    _authenticationBloc!.close();
    super.dispose();
  }
}
