import 'package:flutter/material.dart';

class PoweredByPage extends StatefulWidget {
  @override
  _PoweredByPageState createState() => _PoweredByPageState();
}

class _PoweredByPageState extends State<PoweredByPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final image = "assets/data/nollning_26/nolleguide/poweredby.png";
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color.fromRGBO(9, 72, 123, 1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          scrolledUnderElevation: 0.0,
        ),
        body: InteractiveViewer(
            panEnabled: true,
            child: SingleChildScrollView(child: Image.asset(
              image,
              cacheHeight: 2000,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ))
        )
    );
  }
}