import 'package:e_ticaret/Stly.dart';
import 'package:flutter/material.dart';

import 'BottomBar.dart';
import 'Head.dart';

// ignore: must_be_immutable
class ProductDetailPage extends StatefulWidget {
  String? productData;
  ProductDetailPage(this.productData);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color? selectedColor;
  int? selectedCapasity = 64;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFFA7FFEB),
    Color(0xFF6F7972),
    Color(0xFFF5D8D0)
  ];
  List<int> capasities = [64, 128, 256];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              header(widget.productData.toString(), context),
              SizedBox(
                height: 32,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView(
                    children: [
                      //  label("New"),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/iphone.jpg",
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Text(
                        "Color",
                        style: kAltBaslikStyle,
                      ),
                      SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: colors
                            .map((Color color) => Column(children: [
                                  colorOption(
                                      color: color,
                                      selected: selectedColor == color,
                                      onTap: () {
                                        setState(() {
                                          selectedColor = color;
                                        });
                                      })
                                ]))
                            .toList(),

                        ///KAPASİTE
                      ),
                      SizedBox(height: 32),
                      Text(
                        "Capasity",
                        style: kAltBaslikStyle,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: capasities
                            .map((int number) => capasityOption(
                                gb: number,
                                selected: selectedCapasity == number,
                                onTap: () {
                                  setState(() {
                                    selectedCapasity = number;
                                  });
                                }))
                            .toList(),
                      ),
                      SizedBox(height: 32),

                      ///SEPETE EKLEME
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            print("Product added to cart");
                            print("Product name:" +
                                widget.productData.toString());
                            print("Product color:" + selectedColor.toString());
                            print("Product capasity:" +
                                selectedCapasity.toString());
                            //   bottomBar("cart"); işe yaramıyor
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.amber),
                          child: Text(
                            "Add to cart",
                            textAlign: TextAlign.center,
                            style: kMenuBaslikStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          bottomBar("search"),
        ]),
      ),
    );
  }
}

Widget colorOption(
    {required Color color, required bool selected, required Function onTap}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:
              Border.all(color: Color(0xFF0001FC), width: selected ? 2 : 0)),
      width: 23,
      height: 23,
    ),
  );
}

Widget capasityOption(
    {required int gb, required bool selected, required Function onTap}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 23, left: 30),
          child: Text(
            "$gb GB",
            style: selected ? kMenuBaslik2Style : kMenuBaslikStyle,
          ),
        ),
      ],
    ),
  );
}

//0xFF52514F
