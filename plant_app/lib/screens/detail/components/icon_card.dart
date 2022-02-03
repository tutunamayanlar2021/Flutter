
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 22,
                  color: kPrimaryColor.withOpacity(0.22),
                ),
                const BoxShadow(
                  offset: Offset(-15, -15),
                  blurRadius: 20,
                  color: Colors.white,
                )
              ]),
          child: SvgPicture.asset(icon),
        ),
      ],
    );
  }
}
