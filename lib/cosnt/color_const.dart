import 'package:flutter/material.dart';

class colors {
  static const List<Color> gradientColor = [
    Color.fromARGB(255, 60, 182, 235),
    Color(0xff33afe3),
    Color(0xff5199ea),
    Color(0xff7292ef),
    Color(0xff9e80f6),
    Color(0xffc16afd),
    Color(0xffcf69f4),
    Color(0xffd973d9),
    Color(0xffdb74d1),
    Color(0xffe17bc1),
    Color(0xffe981ab),
    Color(0xffec859e),
    Color(0xfff58c87),
    Color(0xfff8907b),
    Color(0xfffc946d),
  ];

  static const List<LinearGradient> colorGradients = [
    // Yellow Gradient
    LinearGradient(
      colors: [Color(0xFFFFF176), Color(0xFFFFEB3B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // Red Gradient
    LinearGradient(
      colors: [Color(0xFFEF5350), Color(0xFFB71C1C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // Green Gradient
    LinearGradient(
      colors: [Color(0xFF66BB6A), Color(0xFF1B5E20)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // Blue Gradient
    LinearGradient(
      colors: [Color(0xFF42A5F5), Color(0xFF0D47A1)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    // Purple Gradient
    LinearGradient(
      colors: [Color(0xFFAB47BC), Color(0xFF4A148C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];

  static const Color grey = Colors.grey;
  static const Color tileColor = Color(0xfffefffe);
  static const Color disableColor = Color(0xffede9f0);
  static const Color blackColor = Color.fromARGB(255, 32, 32, 32);
  static const Color textColor = Color(0xff98abc2);
  static Color unreadColor = Color(0xFFFFF176).withOpacity(0.2);
}
