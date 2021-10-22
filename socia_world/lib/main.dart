import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'gonderi_karti.dart';

import 'profil_karti.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Project',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.grey,
          iconSize: 32.0,
        ),
        title: const Text(
          "Sociaworld",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => Column(
                        children: [
                          duyuru("kamil seni takip etti", "2 dk önce"),
                          duyuru("merve gönderine yorum attı", "3 dk önce"),
                          duyuru("yusuf gönderini beğendi", "2 saat önce"),
                        ],
                      ));
            },
            icon: const Icon(Icons.notifications),
            color: Colors.purple[300],
            iconSize: 32.0,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0.0, 3.0),
                  color: Colors.grey,
                  blurRadius: 5,
                )
              ],
            ),
            child: ListView(scrollDirection: Axis.horizontal, children: const [
              ProfileKartiOlustur(
                kullaniciAdi: "Menal",
                url:
                    "https://cdn.pixabay.com/photo/2016/03/23/04/01/woman-1274056__340.jpg",
                backPic:
                    'https://cdn.pixabay.com/photo/2016/03/26/23/17/woman-1281830__340.jpg',
                isim: 'mnlbky',
              ),
              ProfileKartiOlustur(
                kullaniciAdi: "Selim",
                url:
                    "https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814__340.jpg",
                backPic:
                    'https://cdn.pixabay.com/photo/2015/04/19/08/32/rose-729509__340.jpg',
                isim: 'slm',
              ),
              ProfileKartiOlustur(
                kullaniciAdi: "Ali",
                url:
                    "https://cdn.pixabay.com/photo/2019/12/11/21/12/portrait-4689313__340.jpg",
                backPic:
                    'https://cdn.pixabay.com/photo/2016/02/23/07/37/wall-1217083__340.jpg',
                isim: 'aliii',
              ),
              ProfileKartiOlustur(
                kullaniciAdi: "Derya",
                url:
                    "https://cdn.pixabay.com/photo/2017/11/29/09/15/paint-2985569__480.jpg",
                backPic:
                    'https://cdn.pixabay.com/photo/2018/03/12/12/32/woman-3219507__340.jpg',
                isim: 'deryako',
              ),
              ProfileKartiOlustur(
                kullaniciAdi: "Deniz",
                url:
                    "https://cdn.pixabay.com/photo/2015/09/02/12/39/woman-918583__340.jpg",
                backPic:
                    'https://cdn.pixabay.com/photo/2018/02/24/20/39/clock-3179167__340.jpg',
                isim: 'dennnn',
              ),
              ProfileKartiOlustur(
                kullaniciAdi: 'Murad',
                url:
                    'https://cdn.pixabay.com/photo/2012/04/18/23/36/boy-38262__340.png',
                backPic:
                    'https://cdn.pixabay.com/photo/2017/12/11/15/34/lion-3012515__340.jpg',
                isim: 'mrd25',
              ),
            ]),
          ),
          const SizedBox(
            height: 10.0,
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
          const GonderiKarti(
            ppLink:
                "https://cdn.pixabay.com/photo/2019/12/11/21/12/portrait-4689312__340.jpg",
            gecenSure: '3 saat önce',
            isim: ' Jon Harper',
            sendPicLink:
                'https://cdn.pixabay.com/photo/2019/12/11/21/15/portrait-4689319__340.jpg',
            title: "True love",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Padding duyuru(String mesaj, String sure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          Text(sure),
        ],
      ),
    );
  }
}
