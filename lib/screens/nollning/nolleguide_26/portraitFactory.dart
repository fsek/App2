import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortraitFactory {
  static Widget generatePortrait({
    required String imagePath,
    required int size,
    VoidCallback? onTap
  }){
    return Row(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: size, child: InkWell(onTap: onTap, child: Image.asset(imagePath, fit: BoxFit.fitWidth))),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }

  static Widget generateDoublePortrait({
    required String leftImagePath,
    required String rightImagePath,
    required int size,
    VoidCallback? leftOnTap,
    VoidCallback? rightOnTap
  }){
    return Row(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: size, child: InkWell(onTap: leftOnTap, child: Image.asset(leftImagePath, fit: BoxFit.fitWidth))),
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(flex: size, child: InkWell(onTap: rightOnTap, child: Image.asset(rightImagePath, fit: BoxFit.fitWidth))),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }

  static List<Widget> addSpacing({
    required double space,
    required List<Widget> items,
  }){
    final box = SizedBox(height: space);
    final result = <Widget>[];
    for(var i = 0; i < items.length; i++){
      result.add(items[i]);
      if(i != items.length - 1) result.add(box);
    }

    return result;
  }
}