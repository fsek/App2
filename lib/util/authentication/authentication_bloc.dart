import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fsek_mobile/models/devise_token.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:fsek_mobile/util/app_exception.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class TokenCallback {
  String message;
  Function callback;
  TokenCallback(this.message, this.callback);
}

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserService userService;
  final List<TokenCallback> onTokenRefreshCallbacks = [];
  AuthenticationBloc({required this.userService}) : super(AuthenticationUninitialized());

  void addTokenRefreshCallback(TokenCallback callback) {
    onTokenRefreshCallbacks.add(callback);
  }

  void executeCallbacks() {
    for(TokenCallback f in onTokenRefreshCallbacks) {
      f.callback();
    }
    onTokenRefreshCallbacks.clear();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    // On app start check if we have a token already, if not we have to login
    if (event is AppStarted) {
      final bool hasToken = await userService.isAuthenticated();
      final bool tokenValid = await userService.isValid();

      if (hasToken && tokenValid) {
        yield AuthenticationAuthenticated();
        this.add(Authenticated());
      } else if(hasToken && !tokenValid) {
        this.add(TokenRevoked());
      }
      else {
        yield AuthenticationUnauthenticated();
      }
    }

    // When a user has LoggedIn we store the token and tell the App that hes authenticated
    if (event is LoggedIn) {
      yield AuthenticationLoading();
      if(event.token is! DeviseToken) {
        this.add(LoggedOut());
        return; 
      }

      userService.storeToken(event.token!);
      yield AuthenticationAuthenticated();
      this.add(Authenticated());
      yield AuthenticationLoading();
    }

    // We need the User-info from the API on authentication so we fetch that
    if (event is Authenticated) {
      try {
        yield AuthenticationUserFetched(messages: onTokenRefreshCallbacks.map((e) => e.message).toList());
        executeCallbacks();
      }
      catch(ex) {
        if(ex is UnauthorisedException)
          yield AuthenticationUnauthenticated();
        else if(ex is SocketException) {
          yield AuthenticationDisconnected();
        }
        else {
          print(ex);
          yield AuthenticationError(error: ex.toString());
        }
      }
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      userService.clearToken();
      yield AuthenticationUnauthenticated();
    }

    if(event is TokenRevoked) {
      userService.clearToken();
      yield AuthenticationUnauthenticated();
    }

    if(event is AppError) {
      yield AuthenticationError(error: event.error);
    }
  }
}
