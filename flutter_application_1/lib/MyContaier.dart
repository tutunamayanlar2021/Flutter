import 'package:flutter/material.dart';

class MyContainerWidget extends StatelessWidget {
  final Color? renk;
  final Widget? child;
  final Function? onPress;
  MyContainerWidget({this.renk = Colors.white, this.child, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: renk,
        ),
        child: child,
      ),
    );
  }
}
