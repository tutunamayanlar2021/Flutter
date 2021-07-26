import 'package:flutter/material.dart';
import 'Stly.dart';

Widget buildNavigation(
    {required String text,
    required IconData iron,
    Widget? widget,
    BuildContext? context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context!, MaterialPageRoute(builder: (context) => widget!));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey[100],
          ),
          child: Icon(
            iron,
            color: Colors.brown[700],
            size: 25,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: kMenuBaslikStyle,
        ),
      ],
    ),
  );
}
