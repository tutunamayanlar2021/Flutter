import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();
  final green = const Color.fromARGB(255, 73, 175, 141);
  final red = const Color.fromARGB(255, 231, 47, 15);
  final grey = const Color.fromARGB(162, 122, 118, 118);
  final white = const Color.fromARGB(255, 255, 255, 255);
   final black = const Color.fromARGB(255, 0, 0, 0);
}
