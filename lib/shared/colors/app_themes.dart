import 'package:flutter/material.dart';

class AppColors {
  static const List<List<Color>> gradients = [
    [Color(0xFF42A5F5), Color(0xFF6A1B9A)], // blue → purple
    [Color(0xFF330954), Color(0xFFCE346A)],
    [Color(0xFF4DB6AC), Color.fromARGB(255, 116, 46, 125)],
  ];

  /// Default App Gradient
  static LinearGradient mainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: gradients[0],
  );
}
