import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';
import 'dart:math';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Phyllotaxis(),
    );
  }
}

class Phyllotaxis extends StatefulWidget {
  const Phyllotaxis({Key? key}) : super(key: key);

  @override
  State<Phyllotaxis> createState() => _PhyllotaxisState();
}

class _PhyllotaxisState extends State<Phyllotaxis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Processing(
        sketch: CanvasPhyllotaxis(),
      ),
    );
  }
}

class CanvasPhyllotaxis extends Sketch {
  final int c = 7;
  final double angulo = 137.5;
  //350=2pi
  //100=x
  //2pi*angulo/360

  int n = 0;

  @override
  void setup() {
    size(width: 500, height: 500);
  }

  @override
  void draw() {
    background(color: Colors.black);
    translate(x: width / 2, y: height / 2);

    final bAngle = n * 0.01;
    for (int i = 0; i < n; i++) {
      final angle = i * (137.5 / 360) * (2 * pi) + bAngle;
      final radius = c * sqrt(i);
      final x = radius * cos(angle);
      final y = radius * sin(angle);
      final hue = (i / 3) % 360;

      fill(color: HSVColor.fromAHSV(1, (radius * 3) % 255, 1, 1).toColor());
      noStroke();
      circle(center: Offset(x, y), diameter: 8);
    }

    n += 2;
    n.clamp(0, 1000);
  }
}
