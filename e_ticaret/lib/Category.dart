import 'dart:ui';

import 'package:e_ticaret/ProductDetail.dart';
import 'package:flutter/material.dart';

import 'BottomBar.dart';
import 'Head.dart';

// ignore: must_be_immutable
class CategoryPage extends StatelessWidget {
  String? categoryText;
  CategoryPage(this.categoryText);
  @override
  Widget build(BuildContext context) {
    List<Map> product = [
      {
        "isim": "Surface laptop 4",
        "fotograf": "assets/images/com.JPG",
        "fiyat": "9999",
      },
      {
        "isim": "Iphone 11 Pro",
        "fotograf": "assets/images/iphone.jpg",
        "fiyat": "9999",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(categoryText!, context),
                  SizedBox(
                    height: 32,
                  ),
                  //  buildContent("text", "assets/images/com.JPG", "6458"),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 8,
                      crossAxisCount: 2,
                      children: product
                          .map((product) => Column(children: [
                                buildContent(
                                    product["isim"],
                                    product["fotograf"],
                                    product["fiyat"],
                                    context)
                              ]))
                          .toList(),
                    ),
                  )
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

Widget buildContent(String text, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductDetailPage(text)));
    },
    child: Container(
      // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 24,
              offset: Offset(0, 16),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 5,
          ),
          Image.asset(
            photoUrl,
            height: 100,
            width: 100,
          ),
          Container(
            width: double.infinity,
            child: Divider(
              color: Colors.brown[900],
            ),
          ),
          Column(
            children: [
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("USD $price",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              SizedBox(
                height: 15,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
