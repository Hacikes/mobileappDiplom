import 'package:flutter/material.dart';

class ColorsForDashboard {
  static List<Color> colors = [
    Colors.green[500]!,
    Colors.red[400]!,
    Colors.blue[500]!,
    Colors.green[300]!,
    Colors.yellow[500]!,
    Colors.pink[500]!,
    Colors.cyanAccent!,
    Colors.orangeAccent!,
    Colors.red[100]!,
    // Добавьте другие цвета, если необходимо
  ];

  static List<Color> getColors() {
    return colors;
  }
  ColorsForDashboard();
}