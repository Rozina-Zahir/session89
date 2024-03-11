import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Boat in Sea'),
        ),
        body: Center(
          child: BoatInSea(),
        ),
      ),
    );
  }
}

class BoatInSea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: BoatPainter(),
      ),
    );
  }
}

class BoatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw sea
    Paint seaPaint = Paint()..color = Colors.blue;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), seaPaint);

    // Draw boat body
    Paint boatPaint = Paint()..color = Colors.brown;
    canvas.drawPath(getBoatPath(size.width, size.height), boatPaint);

    // Draw sail
    Paint sailPaint = Paint()..color = Colors.white;
    canvas.drawPath(getSailPath(size.width, size.height), sailPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Path getBoatPath(double width, double height) {
    Path path = Path();
    path.moveTo(width * 0.25, height * 0.7);
    path.lineTo(width * 0.75, height * 0.7);
    path.lineTo(width * 0.6, height * 0.4);
    path.lineTo(width * 0.4, height * 0.4);
    path.close();
    return path;
  }

  Path getSailPath(double width, double height) {
    Path path = Path();
    path.moveTo(width * 0.5, height * 0.4);
    path.lineTo(width * 0.5, height * 0.05);
    path.lineTo(width * 0.8, height * 0.4);
    path.close();
    return path;
  }
}
