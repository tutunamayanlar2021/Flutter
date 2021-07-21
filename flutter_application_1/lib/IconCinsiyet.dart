import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant.dart';
import 'Constant.dart';

class IconCinsiyet extends StatelessWidget {
  String? cinsiyet;
  IconData? iconx;
  IconCinsiyet({this.cinsiyet, this.iconx});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconx,
          color: Colors.black,
          size: 50,
        ),
        SizedBox(
          height: 10,
        ),
        Text("$cinsiyet", style: kMetinStyle),
      ],
    );
  }
}
