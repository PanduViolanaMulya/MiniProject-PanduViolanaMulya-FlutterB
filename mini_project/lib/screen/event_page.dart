import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      alignment: Alignment.center,
      height: double.maxFinite,
      width: double.maxFinite,
      child: Text('No Available Event ~ ~'),
    );
  }
}
