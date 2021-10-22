import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  IconData button;
  final String txt;

  final fonksiyonum;
  Button({Key? key, required this.button, required this.txt, required this.fonksiyonum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Row(
        children: [
          InkWell(
            //material olmadan renk göstermez
            onTap: fonksiyonum,
            child: Icon(
              button,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            txt,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
