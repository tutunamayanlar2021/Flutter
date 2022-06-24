import 'package:flutter/material.dart';
import 'package:todo_app/constants/color_constants.dart';

class StyleConstants {
  static StyleConstants instance = StyleConstants._init();
  StyleConstants._init();
  final lTitle = TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.bold,
      color: ColorConstants.instance.green);
  final lTitle2 = TextStyle(
      fontSize: 25,
      
      fontWeight: FontWeight.bold,
      color: ColorConstants.instance.black);
  final mTitle = const TextStyle(fontSize: 15);
  final sbTitle = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}
