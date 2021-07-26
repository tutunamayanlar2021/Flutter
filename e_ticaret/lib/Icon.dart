import 'package:flutter/material.dart';

Widget buildIcon(bool active, IconData icon) {
  return Icon(icon, size: 25, color: Color(active ? 0xFFFFCA28 : 0xFF000000));
}
