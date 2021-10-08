import 'package:burc/model/burc.dart';
import 'package:burc/model/burc_item.dart';
import 'package:flutter/material.dart';

import 'strings.dart';

// ignore: must_be_immutable
class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  // ignore: use_key_in_widget_constructors
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Burç Listesi"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => BurcItem(
            listenelenecekBurc: tumBurclar[index],
          ),
          itemCount: tumBurclar.length,
        ),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];

    for (int i = 0; i < 12; i++) {
      var burcAd = Strings.burcAdlari[i];
      var burcTarih = Strings.burcTarihleri[i];
      var burcDetay = Strings.burcGenelOzellikleri[i];
      var burcKresim = Strings.burcAdlari[i].toLowerCase() + '${i + 1}.png';
      var burcBresim =
          Strings.burcAdlari[i].toLowerCase() + '_buyuk' + '${i + 1}.png';
      Burc eklenecekBurc =
          Burc(burcAd, burcTarih, burcDetay, burcKresim, burcBresim);

      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
