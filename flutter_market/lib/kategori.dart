import 'package:flutter/material.dart';
import 'package:flutter_market/constants/padding_constant.dart';
import 'package:flutter_market/constants/style_constant.dart';
import 'package:flutter_market/urun_detay.dart';

class Kategori extends StatefulWidget {
  final String kategori;

  const Kategori({Key? key, required this.kategori}) : super(key: key);

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  late List<Widget> gosterilecekListe;

  @override
  void initState() {
    super.initState();
    if (widget.kategori == "Temel Gıdalar") {
      gosterilecekListe = [
        urunKarti(
          "Zeytin Yağı",
          "99.99 TL",
          "https://cdn.pixabay.com/photo/2016/05/24/13/29/olive-oil-1412361__340.jpg",
          mevcut: false
          
        ),
        urunKarti(
          "Süt",
          "11.89 TL",
          "https://cdn.pixabay.com/photo/2017/07/05/15/41/milk-2474993__480.jpg",
           mevcut: false
        ),
        urunKarti(
          "Balık",
          "49.90 TL",
          "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg",
        ),
        urunKarti(
          "Ekmek",
          "3.90 TL",
          "https://cdn.pixabay.com/photo/2020/03/12/19/14/food-4925962__340.jpg",
        ),
        urunKarti(
          "Tuz",
          "9.90 TL",
          "https://cdn.pixabay.com/photo/2021/10/21/10/31/salt-6728600__340.jpg",
        ),
        urunKarti(
          "Elma",
          "6.90 TL",
          "https://cdn.pixabay.com/photo/2015/06/10/19/56/apples-805124__340.jpg",
        ),
        urunKarti(
          "Salça",
          "19.90 TL",
          "https://cdn.pixabay.com/photo/2020/12/13/23/23/pizza-5829640__340.jpg",
        ),
        
      ];
    } else if (widget.kategori == "Atıştırmalık") {
      gosterilecekListe = [
        urunKarti(
          "Çikolata",
          "19.90 TL",
          "https://cdn.pixabay.com/photo/2013/09/18/18/24/chocolate-183543__480.jpg",
        ),
        urunKarti(
          "Karışık Kuruyemiş",
          "9.90 TL",
          "https://media.istockphoto.com/photos/mixed-nuts-on-wooden-table-and-bowl-picture-id520889996?b=1&k=20&m=520889996&s=170667a&w=0&h=nALpFPWgMuAcjZVGP7q2n52SRhAugpcp6ZyDdvCd9Eo=",
        ),
        urunKarti(
          "Lokum",
          "29.90 TL",
          "https://media.istockphoto.com/photos/turkish-delight-with-hazelnuts-picture-id1355455923?b=1&k=20&m=1355455923&s=170667a&w=0&h=5cdvGzDvuRF2hzzYE8PsHxqTV1_u8LgcX1YPk-SHUvI=",
        ),
        urunKarti(
          "Ekler",
          "19.90 TL",
          "https://media.istockphoto.com/photos/lightning-picture-id878632692?b=1&k=20&m=878632692&s=170667a&w=0&h=m1PPqwo09TgLOn1N2Xj9Jw0xb0Gt_Rrfy1wwALe5P9o=",
        ),
      ];
    } else if (widget.kategori == "İçecekler") {
      gosterilecekListe = [
        urunKarti(
          "Vişne Suyu ",
          "15.90 TL",
          "https://cdn.pixabay.com/photo/2019/05/13/22/34/berry-4201069__340.jpg",
        ),
        urunKarti(
          "Kola ",
          "11.90 TL",
          "https://cdn.pixabay.com/photo/2020/11/26/17/29/coca-cola-5779718__340.jpg",
        ),
        urunKarti(
          "Nescafe ",
          "45.90 TL",
          "https://cdn.pixabay.com/photo/2020/10/30/18/35/coffee-5699484__480.jpg",
        ),
        urunKarti(
          "6'lı Soda",
          "15.90 TL",
          "https://cdn.pixabay.com/photo/2012/04/03/14/49/six-pack-25200__340.png",
        ),
      ];
    } else if (widget.kategori == "Temizlik") {
      gosterilecekListe = [
        urunKarti(
          "Sabun",
          "10.90 TL",
          "https://cdn.pixabay.com/photo/2017/11/18/01/16/soaps-2958985__340.jpg",
        ),
        urunKarti(
          "Sıvı Sabun ",
          "15.90 TL",
          "https://cdn.pixabay.com/photo/2016/02/11/14/49/soap-1193709__340.jpg",
        ),
        urunKarti(
          "Diş Fırçası",
          "215.90 TL",
          "https://cdn.pixabay.com/photo/2013/05/31/20/03/toothbrush-115105_960_720.jpg",
        ),
        urunKarti(
          "3 'lü Havlu Takımı",
          "45.90 TL",
          "https://cdn.pixabay.com/photo/2016/02/13/12/52/towels-1197773__340.jpg",
        ),
      ];
    }
  }

  Widget urunKarti(String isim, String fiyat, String resimYolu, {bool mevcut=true}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UrunDetay(
                urunAciklama: "Bu kısımda ürün açıklaması olucak",
                urunAdi: isim,
                urunFiyati: fiyat,
                urunUrl: resimYolu,
                mevcut: mevcut,
              ),
            )); //take us to the detail page
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4.0,
                  spreadRadius: 2.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: PaddingConstants.instance.paddingAllNormal,
                child: Hero(
                  tag: resimYolu,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(resimYolu), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              isim,
              style: StyleConstants.instance.urunTitle,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                fiyat,
                style: StyleConstants.instance.fiyatTitle,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1, //en boy oranı
        padding: PaddingConstants.instance.paddingAll8,
        children: gosterilecekListe);
  }
}
