import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleWhitMoreBtn extends StatelessWidget {
 
  const TitleWhitMoreBtn({
    Key? key,
    required this.proses, required this.title,
  }) : super(key: key);
 final Function proses;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
         TitleWithCustumUnderline(
            text:title,
          ),
          const Spacer(),
          TextButton(
            onPressed: proses.call(),
            child: const Text("More", style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithCustumUnderline extends StatelessWidget {
  const TitleWithCustumUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        height: 24,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: kDefaultPadding / 6),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.only(right: kDefaultPadding / 4),
                height: 5,
                color: kPrimaryColor.withOpacity(0.2),
                child: const Text("more"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
