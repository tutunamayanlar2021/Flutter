import 'package:e_ticaret/BottomBar.dart';
import 'package:e_ticaret/Category.dart';

import 'package:flutter/material.dart';

import 'Head.dart';

// ignore: must_be_immutable
class CategoriesPage extends StatelessWidget {
  List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smartphones",
    "Smart Objects",
    "Speakers"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                //Baslik
                children: [
                  ///header
                  header("Categories", context),
                  SizedBox(
                    height: 16,
                  ),
                  //kategoriler
                  Expanded(
                    child: ListView(
                      children: categories
                          .map((String title) => buildCategori(title, context))
                          .toList(),
                    ),
                  ),
                  //bottom nav
                ],
              ),
            ),
            bottomBar("search"),
          ],
        ),
      ),
    );
  }
}

Widget buildCategori(String title, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CategoryPage(title)));
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    ),
  );
}
