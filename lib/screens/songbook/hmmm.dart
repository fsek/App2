import 'package:flutter/material.dart';

class HmmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm")),
      body: Center(
        child: Image.asset(
          'assets/img/memes/hmm.gif', //Källa: https://imgur.com/EudhFzO
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
