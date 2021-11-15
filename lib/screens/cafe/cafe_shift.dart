import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/cafe/cafe_shift.dart';
import 'package:fsek_mobile/services/cafe.service.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/abstract.service.dart';

class CafeShiftPage extends StatefulWidget {
  final int shiftId;
  CafeShiftPage({Key? key, required this.shiftId}) : super(key: key);
  @override
  _CafeShiftPageState createState() => _CafeShiftPageState();
}

class _CafeShiftPageState extends State<CafeShiftPage> {
  CafeShift? shift;

  void initState() {
    locator<CafeService>().getShift(widget.shiftId).then((value) => setState(() {
          this.shift = value;
        }));
    super.initState();
  }

  void signup(CafeShift shift) {
    locator<CafeService>().cafeShiftSignup(shift);
  }

  Widget build(BuildContext context) {
    if (shift == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cafépass'),
        ),
      );
    }

    // Different text if user is already signed up to shift
    String headerText = "";
    if (shift!.isme ?? false) {
      headerText = "Du är anmäld ";
    } else {
      headerText = "Anmälan ";
    }
    headerText += "till pass kl ${shift!.duration}";

    return Scaffold(
      appBar: AppBar(
        title: Text('Cafépass'),
      ),
      body: Column(
        children: [Text(headerText), TextButton(onPressed: () => signup(shift!), child: Text("Anmäl mig :))"))],
      ),
    );
  }
}
