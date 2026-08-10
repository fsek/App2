import 'package:flutter/material.dart';

extension PortraitSpacing on List<Widget> {
  List<Widget> withSpacing(double space) {
    final result = <Widget>[];
    for (var i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) {
        result.add(SizedBox(height: space));
      }
    }
    return result;
  }
}