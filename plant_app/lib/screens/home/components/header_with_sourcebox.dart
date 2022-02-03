import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class HeaderWithSourceBox extends StatelessWidget {
  const HeaderWithSourceBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.2,
      // color: Colors.black,//bu
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kDefaultPadding + 36),
            height: size.height * 0.2 - 37,//SOURCE SPACE 
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.0),
                bottomRight: Radius.circular(36.0),
              ),
            ),
            child: Row(
              children: [
                Text(
                  "Hi Kader!",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Image.asset("assets/images/logo.png")
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
            alignment: Alignment.center,
              height: 54,
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor.withOpacity(0.23),
                      blurRadius: 50,
                      offset: const Offset(0, 10))
                ],
              ),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: "Source",
                    hintStyle:
                        TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                    enabledBorder: InputBorder.none,
                    focusedBorder:
                        InputBorder.none, // source cubugundaki çizgiler
                    suffixIcon: Icon(
                      Icons.search,
                      
                      color: kPrimaryColor.withOpacity(0.5),
                      
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
