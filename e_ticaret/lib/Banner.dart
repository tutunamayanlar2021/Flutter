import 'package:flutter/material.dart';

Widget buildBanner() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(right: 36, left: 24, top: 18, bottom: 18),
      decoration: BoxDecoration(
          color: Colors.amberAccent, borderRadius: BorderRadius.circular(6.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bose Home Speaker",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "USD 279",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              "assets/images/BoseSpeaker.jpg",
            ),
          )
        ],
      ),
    ),
  );
}
