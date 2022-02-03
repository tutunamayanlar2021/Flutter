
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key, required this.price, required this.title, required this.country,
  }) : super(key: key);
  final int price;
  final String title, country;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          country,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w300, color: kPrimaryColor),
        ),
        trailing: Text(
          "\$$price",
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: kPrimaryColor),
        ),
      ),
    );
  }
}
