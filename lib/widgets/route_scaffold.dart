import 'package:flutter/material.dart';

class RouteScaffold extends StatefulWidget {
  RouteScaffold({this.child}): super();
  
  final Widget child;

  _RouteScaffoldState createState() => _RouteScaffoldState();
}

class _RouteScaffoldState extends State<RouteScaffold> {
  @override
  Widget build(BuildContext context) {
    var _appBar = SafeArea(child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: () => Navigator.pop(context),),
        ],));

    var _background = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFF6E48AA), const Color(0xFF9D50BB)]
      )
    );

    return Material(child: SafeArea(
      top: false,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Content
          Container(
            decoration: _background,
            child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(child: Container(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(padding: EdgeInsets.only(top: 72), child: widget.child)));
            })),
          // Title
          _appBar
        ])));
  }
}