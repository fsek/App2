import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:fsek_mobile/models/user/user.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent({List props = const []});
  
  @override
  List<Object> get props => props;
}

class HomeInitialized extends HomeEvent {
  final User user;

  HomeInitialized({@required this.user}) : super(props: [user]);

  @override
  String toString() => 'HomeInitialized { user: $user }';
}

class SilentReload extends HomeEvent {
  final User user;

  SilentReload({@required this.user}) : super(props: [user]);

  @override
  String toString() => 'SilentReload { user: $user }';
}

class HomeDataFetched extends HomeEvent {}