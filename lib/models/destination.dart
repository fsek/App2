import 'package:flutter/material.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.widget);
  final int index;
  final String title;
  final IconData icon;
  final Widget widget;
}