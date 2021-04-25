import 'package:flutter/material.dart';
import 'package:fsek_mobile/util/app_exception.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }
  void pop() {
    if(navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
    else {
      throw new AppException("Fatal error in Navigator Service");
    }
  }
}