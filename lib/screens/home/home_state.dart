import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  //final List<MobileWarning> mobileWarnings;

  const HomeSuccess(/*{@required this.mobileWarnings}*/);

  @override
  List<Object> get props => [/*mobileWarnings*/];

  @override
  String toString() => 'HomeSuccess { mobileWarnings: {mobileWarnings?.length} }';
}

class HomeError extends HomeState {
  final String error;

  const HomeError({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeError { error: $error }';
}