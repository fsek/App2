import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUserFetched extends AuthenticationState {
  final List<String> messages;

  const AuthenticationUserFetched({required this.messages});

  @override
  List<Object> get props => [messages];

  @override
  String toString() => 'AuthenticationUserFetched { messages: ${messages.length} }';
}

class AuthenticationTokenRefreshed extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationDisconnected extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String error;

  const AuthenticationError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthenticationError { error: $error }';
}