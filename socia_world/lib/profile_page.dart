import 'dart:ui';

import 'package:flutter/material.dart';

import 'gonderi_karti.dart';

class ProfilePage extends StatelessWidget {
  final String adi;
  final String kullaniciAdi;
  final String backPicLink;
  final String ppLink;

  const ProfilePage(
      {Key? key,
      required this.adi,
      required this.kullaniciAdi,
      required this.backPicLink,
      required this.ppLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 230,
                //   color: Colors.yellow,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(backPicLink), fit: BoxFit.cover)),
              ),
              Positioned(
                ///
                bottom: 0.0,
                left: 20.0,
                child: Hero(
                  tag:kullaniciAdi ,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            ppLink,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.lightBlue,
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 140.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      kullaniciAdi,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      adi,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 60,
                right: 15,
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[200],
                    border: Border.all(width: 2.0, color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_circle,
                        size: 18,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Takip et",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 75,
            color: Colors.grey.withOpacity(0.1), //opaklık vermek için
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sayac(20, "Takipçi"),
                sayac(500, "Takip"),
                sayac(20, "Gönderi"),
              ],
            ),
          ),
          const GonderiKarti(
            ppLink:
                "https://cdn.pixabay.com/photo/2018/01/13/19/39/fashion-3080644__340.jpg",
            gecenSure: '1 saat önce',
            isim: 'Jennifer Cones',
            sendPicLink:
                'https://cdn.pixabay.com/photo/2020/10/19/08/16/car-5667107__340.jpg',
            title: "It's mine",
          ),
        ],
      ),
    );
  }

  Column sayac(int takipciSayisi, String txt) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$takipciSayisi",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Text(
          txt,
          style: const TextStyle(
              fontSize: 15.0, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
