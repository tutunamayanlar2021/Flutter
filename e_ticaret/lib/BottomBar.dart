import 'package:flutter/material.dart';

import 'Icon.dart';

Widget bottomBar(String page) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(offset: Offset(0, -3), color: Colors.black.withOpacity(0.25))
      ], color: Colors.grey[300]),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildIcon(
            page == "home",
            Icons.home_filled,
          ),
          buildIcon(page == "search", Icons.search),
          buildIcon(page == "cart", Icons.shopping_cart),
          buildIcon(page == "profile", Icons.person)
        ],
      ),
    ),
  );
}
