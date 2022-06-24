import 'package:flutter/cupertino.dart';

class PaddingConstants {
  static PaddingConstants instance = PaddingConstants._init();
  PaddingConstants._init();
  final paddingAllNormal = const EdgeInsets.all(16.0);
  final paddingAll8 = const EdgeInsets.all(8.0);
  final paddingAll15 = const EdgeInsets.all(15.0);
  final paddingSymmetric = const EdgeInsets.symmetric(horizontal: 20,vertical: 30);
}
