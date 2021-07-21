import 'package:flutter_application_1/user_data.dart';
import 'user_data.dart';
import 'Constant.dart';
import 'package:flutter/material.dart';
import 'user_data.dart';
import 'Hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SONUÇ',
          style: kMetinStyle,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, //EXPECTED LIFE
        children: [
          Expanded(
            child: Center(
                child: Text(
              Hesap(userData: userData).Hesaplama().round().toString(),
              style: kMetinStyle,
            )),
            flex: 11,
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "GERİ DÖN",
                style: kMetinStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
