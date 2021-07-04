import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/destination.dart';
import 'package:fsek_mobile/util/app_exception.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = new GlobalKey();
  Map<String, StatefulWidget Function(dynamic)> routes = {};
  List<Destination> navbarDestinations = [];
  List<Widget> wizards = [];
  StreamController onNavigation = StreamController<Type>.broadcast();

  void dispose() {
    onNavigation.close();
  }
  
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
  void pop() {
    if(navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
    else {
      throw new AppException("Fatal error in Navigator Service");
    }
  }
}