import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/title_with_more_btn.dart';
import 'featured_planet.dart';
import 'header_with_sourcebox.dart';
import 'recomend_plant.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSourceBox(size: size),
          TitleWhitMoreBtn(
            proses: () {},
            title: 'Recomended',
          ),
          const RecomendsPage(),
          TitleWhitMoreBtn(proses: () {}, title: "Featured Plants"),
        const FeaturedPlants(),
       const SizedBox(height: kDefaultPadding,)
        ],
      ),
    );
  }
}



