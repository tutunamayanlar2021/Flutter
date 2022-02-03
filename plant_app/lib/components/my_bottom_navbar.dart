import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, 10),
          blurRadius: 35,
          color: kPrimaryColor.withOpacity(0.38),
        ),
      ], color: Colors.white),
      child: Padding(//farklı olrak eklediğim
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/flower.svg")),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/heart-icon.svg")),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/user-icon.svg"))
          ],
        ),
      ),
    );
  }
}

