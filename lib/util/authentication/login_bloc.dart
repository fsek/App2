import 'dart:async';

import 'package:fsek_mobile/models/devise_token.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
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

      DeviseToken token;
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
      
      if(token.error != null && token.error.isNotEmpty) {
        yield LoginFailure(error: token.error);
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
}
