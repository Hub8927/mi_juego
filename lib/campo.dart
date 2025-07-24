import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GameScreen());
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double x = 100;
  double y = 100;
  double dx = 2;
  double dy = 2;
  double radius = 10;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        moveBall();
      });
    });
  }

  void moveBall() {
    // Tamaño del campo
    double maxWidth = 300;
    double maxHeight = 500;

    // Verificar colisiones con los bordes
    if (x + dx < 0 || x + dx > maxWidth - radius * 2) dx = -dx;
    if (y + dy < 0 || y + dy > maxHeight - radius * 2) dy = -dy;

    x += dx;
    y += dy;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Campo de Juego")),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          color: Colors.grey[300],
          child: CustomPaint(painter: GamePainter(x, y, radius)),
        ),
      ),
    );
  }
}

class GamePainter extends CustomPainter {
  final double x, y, radius;

  GamePainter(this.x, this.y, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final ballPaint = Paint()..color = Colors.blue;
    canvas.drawCircle(Offset(x + radius, y + radius), radius, ballPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
