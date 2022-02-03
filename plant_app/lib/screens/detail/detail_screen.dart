import 'package:flutter/material.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      
      body: Body(),
    );
  }
}