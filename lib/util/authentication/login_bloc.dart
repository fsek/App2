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
    required this.authenticationBloc,
    required this.userService,
  }) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginButtonPressed) {
      emit(LoginLoading());

      var token;
      try {
        token = await userService.sendLogin(
          email: event.username,
          pass: event.password,
        );
      }
      catch(ex) {
        authenticationBloc.add(AppError(error: ex.toString())); // Make sure we show an error that we cant connect
        emit(LoginInitial());
        return;   
      }
      
      if(token.error != null && token.error.isNotEmpty) {
        emit(LoginFailure(error: token.error));
        return;
      }

      try {
        authenticationBloc.add(LoggedIn(token: token));
        emit(LoginInitial());
      } catch (ex) {
        emit(LoginFailure(error: token.toString()));
      }
    }
  }
}
