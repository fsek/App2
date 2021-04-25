import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:fsek_mobile/services/home.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/util/app_exception.dart';
import 'package:fsek_mobile/util/authentication/authentication_bloc.dart';
import 'package:fsek_mobile/util/authentication/authentication_event.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc authenticationBloc;

  HomeBloc({
    @required this.authenticationBloc,
  }) : assert(authenticationBloc != null);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeInitialized) {
      yield HomeLoading();
      this.add(SilentReload(user: event.user));
    }

    if (event is SilentReload) {
      //List<MobileWarning> mobileWarnings;

      try {
       // mobileWarnings = await loadData(event);

        //yield HomeSuccess(mobileWarnings: mobileWarnings);
      } on UnauthorisedException {
        authenticationBloc.add(TokenRevoked());
      } catch (e) {
        yield HomeError(error: "Could not get warnings");
      }
    }
  }
/*
  Future<List<MobileWarning>> loadData(SilentReload event) async {
      return await locator<HomeService>().getMobileWarnings();
  }*/
}
