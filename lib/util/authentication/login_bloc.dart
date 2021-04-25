import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:fsek_mobile/models/api_login_result.dart';
import 'package:fsek_mobile/services/user.service.dart';

import 'authentication_bloc.dart';
import 'authentication_event.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  final UserService userService;

  LoginBloc({
    @required this.authenticationBloc,
    @required this.userService,
  }) : assert(authenticationBloc != null), assert(userService != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      var token;
      try {
        token = await userService.sendLogin(
          email: event.username,
          pass: event.password,
        );
      }
      catch(ex) {
        authenticationBloc.add(AppError(error: ex.toString())); // Make sure we show an error that we cant connect
        yield LoginInitial();
        return;   
      }
      
      if(token is APILoginResult) {
        yield LoginFailure(error: describeResult(token));
        return;
      }

      try {
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (ex) {
        yield LoginFailure(error: token.toString());
      }
    }
  }

  static String describeResult(APILoginResult result) {
    switch(result) {
      case APILoginResult.AuthenticationError:
        return "Username or password not correct.";
      case APILoginResult.Disabled:
        return "Your account is disabled. Please contact an administrator.";
      case APILoginResult.LockedOut:
        return "Your account has been locked for failed login attempts. Please contact an administrator.";
      default:
        return "Unknown login error. Please try again.";
    }
  }
}
