import 'package:flutter/material.dart';
import 'package:flutter_market/constants/padding_constant.dart';
import 'package:flutter_market/constants/style_constant.dart';

class Sepetim extends StatelessWidget {
  const Sepetim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Text(
            "Sepetim",
            style: StyleConstants.instance.mTitle,
          ),
        ),
        const ListTile(
          title: Text("Çikolatalı Gofret"),
          subtitle: Text("2 adet x 5.5 TL"),
          trailing: Text("11 TL"),
        ),
        const ListTile(
          title: Text("Vişne Suyu"),
          subtitle: Text("1 adet x 15.5 TL"),
          trailing: Text("15.5 TL"),
        ),
        const ListTile(
          title: Text("Browni Intence"),
          subtitle: Text("2 adet x 3.5 TL"),
          trailing: Text("7 TL"),
        ),
        Padding(
          padding: PaddingConstants.instance.paddingAll8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: PaddingConstants.instance.paddingAllNormal,
                child: Column(
                  children: [
                    Text(
                      "Toplam tutar",
                      style: StyleConstants.instance.mTitle,
                    ),
                    Padding(
                      padding: PaddingConstants.instance.paddingAll8,
                      child: Text(
                        "33.5",
                        style: StyleConstants.instance.lTitle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: PaddingConstants.instance.paddingAll8,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color:  Colors.orange),
                child: Center(child: Text("Alışverişi Tamamla",style: StyleConstants.instance.xTitle,)),
          ),
        )
      ],
    );
  }
}
