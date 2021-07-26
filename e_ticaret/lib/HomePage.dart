import 'package:e_ticaret/BottomBar.dart';
import 'package:e_ticaret/Categories.dart';

import 'package:flutter/material.dart';
import 'Banner.dart';
import 'Header.dart';
import 'Navigation.dart';
import 'Sales.dart';
import 'Stly.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                //Baslik
                children: [
                  buildHeader(),

                  //BANNER
                  buildBanner(),

                  //BUTTON
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //First
                        buildNavigation(
                            text: "Categories",
                            iron: Icons.menu,
                            widget: CategoriesPage(),
                            context: context),
                        buildNavigation(
                            text: "Favorites", iron: Icons.star_border),
                        buildNavigation(
                            text: "Gifts", iron: Icons.card_giftcard),
                        buildNavigation(
                            text: "Best selling", iron: Icons.people),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  //SALES
                  Text(
                    "Sales",
                    style: kAltBaslikStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  //Sales things
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: buildSalesItem(
                          text: "Smartphones",
                          phoneUrl: "assets/images/phone.jpg",
                          discount: "-50%",
                          screenWidth: screenWidth,
                        ),
                      ),
                      buildSalesItem(
                        text: "Monitör",
                        phoneUrl: "assets/images/monitor1.png",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: buildSalesItem(
                          text: "Smartphones",
                          phoneUrl: "assets/images/phone.jpg",
                          discount: "-50%",
                          screenWidth: screenWidth,
                        ),
                      ),
                      buildSalesItem(
                        text: "Smartphone",
                        phoneUrl: "assets/images/phone.jpg",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Bottun
            bottomBar("home"),
          ],
        ),
      ),
    );
  }
}
