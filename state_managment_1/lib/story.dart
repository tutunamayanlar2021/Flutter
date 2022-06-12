import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:state_managment_1/constants/color_contants.dart';

class Story extends StatelessWidget {
  final String url;
  const Story({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DashedCircle(
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(url),
          ),
        ),
        color: ColorConstants.instance.red,
      ),
    );
  }
}
