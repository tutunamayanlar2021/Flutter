import 'package:flutter/material.dart';
import 'package:flutter_application_1/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red[300],
        primaryColor: Colors.red[300],
      ),
      home: InputPage(),
    );
  }
}
