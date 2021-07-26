import 'package:flutter/material.dart';

Widget label(String title) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: Colors.blueGrey[100],
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.brown[700], fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}
