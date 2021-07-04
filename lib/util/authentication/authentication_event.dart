import 'package:equatable/equatable.dart';
import 'package:fsek_mobile/models/devise_token.dart';
import 'package:fsek_mobile/models/user/user.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent({List props = const []});
  
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final DeviseToken? token;

  LoggedIn({required this.token}) : super(props: [token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

class UserFetched extends AuthenticationEvent {
  final User user;

  UserFetched({required this.user}) : super(props: [user]);

  @override
  String toString() => 'UserFetched { user: $user }';
}

class TokenRevoked extends AuthenticationEvent {
  @override
  String toString() => 'TokenRevoked';
}

class Authenticated extends AuthenticationEvent {}

class AppError extends AuthenticationEvent {
  final String error;

  AppError({required this.error}) : super(props: [error]);

  @override
  String toString() => 'AppError { error: $error }';
}