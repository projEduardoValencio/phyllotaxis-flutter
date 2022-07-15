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
  double c = 7;
  static double angulo = 137.5;
  double angRad = 2 * pi * angulo / 360;
  //350=2pi
  //100=x
  //2pi*angulo/360

  double n = 0;

  @override
  Future<void> setup() async {
    // TODO: do setup stuff here
    size(width: 500, height: 500);
    background(color: Colors.black);
  }

  @override
  Future<void> draw() async {
    double posX = width / 2;
    double posY = height / 2;
    translate(x: posY, y: posY);
    for (var i = 0; i <= n; i++) {
      double r = c * sqrt(i);
      double phi = i * angRad;
      double x = cos(phi) * r;
      double y = sin(phi) * r;

      fill(color: HSVColor.fromAHSV(1, (r * 3) % 255, 1, 1).toColor());
      circle(center: Offset(x, y), diameter: 8);
    }

    n += 1;
  }
}
