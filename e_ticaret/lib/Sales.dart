import 'package:e_ticaret/Label.dart';
import 'package:flutter/material.dart';

Widget buildSalesItem(
    {required String text,
    required String phoneUrl,
    required String discount,
    required double screenWidth}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    padding: EdgeInsets.only(top: 12, bottom: 21, left: 30, right: 18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Yüzdelik
        label(discount),
        SizedBox(
          height: 22,
        ),

        ///phone
        Image.asset(
          phoneUrl,
          height: 200,
          width: 100,
        ),
        SizedBox(
          height: 22,
        ),
        //isim
        Text(
          text,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
