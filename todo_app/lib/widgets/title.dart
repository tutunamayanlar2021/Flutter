import 'package:flutter/cupertino.dart';
import 'package:todo_app/constants/style_constants.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Todo App",
      style: StyleConstants.instance.lTitle,
      textAlign: TextAlign.center,
    );
  }
}
