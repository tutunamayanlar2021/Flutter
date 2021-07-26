import 'package:flutter/material.dart';

import 'Stly.dart';

Widget header(String title, context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(
      height: 30,
    ),
    GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 32,
      ),
    ),
    SizedBox(
      height: 24,
    ),
    Text(
      title,
      style: kAltBaslikStyle,
    )
  ]);
}
