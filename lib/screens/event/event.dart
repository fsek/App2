import 'package:flutter/material.dart';
import 'package:fsek_mobile/models/home/event.dart';
import 'package:intl/intl.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key, required this.event}) : super(key: key);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evenemang'),
      ),
      body: Container(
        width: double.infinity,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  event.title ?? "ingen titel",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.orange[600],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Divider(),
              Text(
                /* better error checking */
                DateFormat("kk:mm").format(event.start ?? DateTime.now()) +
                    " - " +
                    DateFormat("kk:mm").format(event.end ?? DateTime.now()) +
                    ", " +
                    DateFormat("MMMMd").format(event.start ?? DateTime.now()),
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                event.location ?? "intigheten",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
              const Divider(),
              Container(
                margin: EdgeInsets.all(10),
                /* should be parsed html */
                child: Text(event.description ?? "ingen beskrivning"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
