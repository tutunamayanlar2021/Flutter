


import 'package:flutter/material.dart';
import 'package:flutter_market/constants/padding_constant.dart';
import 'package:flutter_market/constants/style_constant.dart';
import 'package:flutter_market/kategori.dart';

class Urunler extends StatefulWidget {
  
  const Urunler({Key? key}) : super(key: key);

  @override
  State<Urunler> createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> with SingleTickerProviderStateMixin {
  late TabController tvController;
   int indexIcerik = 0;
  @override
  void initState() {
    super.initState();
    tvController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(controller: tvController,
        indicatorColor: Colors.orange,
        labelColor:Colors.orange,
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        labelStyle: StyleConstants.instance.sTitle,
      
         tabs: const[
          Tab(
            child: Text("Temel Gıda" ),
          ),
          Tab(
            child: Text("Atıştırmalık"),
          ),
          Tab(
            child: Text("İçecekler"),
          ),
          Tab(
            child: Text("Temizlik"),
          ),
        ]),
        Expanded(
          
          child: Padding(//burada bir container vardı
            padding:PaddingConstants.instance.paddingAll8,
            child: TabBarView(controller: tvController, children: const [
            Kategori(kategori: "Temel Gıdalar",),
            Kategori(kategori:"Atıştırmalık" ,),
            Kategori(kategori: "İçecekler",),
            Kategori(kategori: "Temizlik",),
            ]),
          ),
        )
      ],
    );
  }
}
