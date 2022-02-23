import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/screen/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              color: Theme.of(context).scaffoldBackgroundColor,
              actionsIconTheme:
                  IconTheme.of(context).copyWith(color: Colors.red))),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomePage(),
    );
  }
}
