import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile_page.dart';

class ProfileKartiOlustur extends StatelessWidget {
  final String kullaniciAdi;
  final String url;
  final String isim;
  final String backPic;
  const ProfileKartiOlustur(
      {Key? key,
      required this.kullaniciAdi,
      required this.url,
      required this.isim,
      required this.backPic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
          bool donenVeri = await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      ppLink: url,
                      adi: isim,
                      backPicLink: backPic,
                      kullaniciAdi: kullaniciAdi,
                    )),
          );
          if (donenVeri) {
            print("başarılı");
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              Stack(alignment: Alignment.topRight, children: [
                Hero(
                  tag:kullaniciAdi,
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2.0),
                      borderRadius: BorderRadius.circular(35.0),
                      image: DecorationImage(
                          image: NetworkImage(url), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  kullaniciAdi,
                  style: const TextStyle(fontSize: 13.0, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
