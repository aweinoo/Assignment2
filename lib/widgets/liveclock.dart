import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'clockpainter.dart'; // Make sure this path is correct

class LiveClock extends StatefulWidget {
  const LiveClock({super.key});

  @override
  State<LiveClock> createState() => _LiveClockState();
}

class _LiveClockState extends State<LiveClock>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((_) {
      setState(() {
        _dateTime = DateTime.now();
      });
    })..start(); // Start ticker immediately
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: CustomPaint(painter: ClockPainter(dateTime: _dateTime)),
    );
  }
}
