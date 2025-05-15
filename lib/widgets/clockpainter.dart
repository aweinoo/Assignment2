// ignore_for_file: library_prefixes

import 'dart:math' as Math;

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background circle
    final fillBrush = Paint()..color = const Color(0xFFEDFEFF).withOpacity(0.8);
    final fillBrush2 = Paint()..color = const Color(0xFFFFFFFF);

    canvas.drawCircle(center, radius, fillBrush);

    // Clock numbers
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final numberStyle = TextStyle(
      color: Colors.teal[700],
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    final positions = {
      "12": Offset(center.dx - 8, center.dy - radius + 6),
      "3": Offset(center.dx + radius - 16, center.dy - 8),
      "6": Offset(center.dx - 8, center.dy + radius - 20),
      "9": Offset(center.dx - radius + 6, center.dy - 8),
    };

    positions.forEach((text, offset) {
      textPainter.text = TextSpan(text: text, style: numberStyle);
      textPainter.layout();
      textPainter.paint(canvas, offset);
    });

    // ANGLES
    final second = dateTime.second + dateTime.millisecond / 1000;
    final minute = dateTime.minute + second / 60;
    final hour = dateTime.hour % 12 + minute / 60;

    final secondAngle = (second * 6) * (3.1415926 / 180); // in radians
    final minuteAngle = (minute * 6) * (3.1415926 / 180);
    final hourAngle = (hour * 30) * (3.1415926 / 180);

    // Hour hand
    final hourHand =
        Paint()
          ..color = Colors.teal[700]!
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      Offset(
        center.dx + 25 * Math.sin(hourAngle),
        center.dy - 25 * Math.cos(hourAngle),
      ),
      hourHand,
    );

    // Minute hand
    final minuteHand =
        Paint()
          ..color = Colors.teal[300]!
          ..strokeWidth = 3
          ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      Offset(
        center.dx + 35 * Math.sin(minuteAngle),
        center.dy - 35 * Math.cos(minuteAngle),
      ),
      minuteHand,
    );

    // Second hand
    final secondHand =
        Paint()
          ..color = Colors.grey[400]!
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      center,
      Offset(
        center.dx + 45 * Math.sin(secondAngle),
        center.dy - 45 * Math.cos(secondAngle),
      ),
      secondHand,
    );

    canvas.drawCircle(center, 5, fillBrush2);
  }

  double degToRad(double deg) => deg * 3.1415926535897932 / 180;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
