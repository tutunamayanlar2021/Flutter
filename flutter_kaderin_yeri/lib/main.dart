import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: 'Pacifico'),//varsayılan yazım şeklini bu yapmış oluruz
      home: Scaffold(
        backgroundColor: Colors.brown[300],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.lime,
                  backgroundImage: AssetImage('assets/images/kahve.png'),
                ),
                Text(
                  "Kader Kahve",
                  style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 30,
                    color: Colors.brown[900],
                  ),
                ),
                Text(
                  "Bir ömür uzağınızda",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                  ),
                ),
                Container(
                  width: 300,
                  child: Divider(
                    height: 30,
                    color: Colors.brown[900],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 45.0),
                  color: Colors.brown[900],
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    title: Text(
                      "kaderkahve@gmail.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 45.0),
                  color: Colors.brown[900],
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    title: Text(
                      "+90 553 204 785",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
