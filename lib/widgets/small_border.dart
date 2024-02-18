import 'package:flutter/widgets.dart';

class SmallBorder extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 2 / 3,
      height: 1,
      decoration: BoxDecoration(color: Color(0x33FFFFFF)),
    );
  }
}
