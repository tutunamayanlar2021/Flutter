
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/home/tabbar_view.dart';


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
     
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData.light().copyWith(
          appBarTheme:
              AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
          tabBarTheme:const TabBarTheme(
          labelColor: CupertinoColors.black,
            unselectedLabelColor: CupertinoColors.inactiveGray
          )),
      home:const TwitterTabbarView(),
           color: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

TextStyle style = const TextStyle(fontSize: 20);

TextStyle style2 = const TextStyle(fontSize: 10);
