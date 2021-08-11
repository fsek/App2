import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/nollning/nollning_group.dart';

class AdventureMissionsTab extends StatefulWidget {
  AdventureMissionsTab({required this.group});

  final NollningGroup group;

  @override
  _AdventureMissionsTabState createState() => _AdventureMissionsTabState();
}

class _AdventureMissionsTabState extends State<AdventureMissionsTab> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text("Ingen faddergrupp är tillgänglig :(");
  }
}
