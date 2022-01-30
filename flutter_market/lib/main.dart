import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_market/constants/style_constant.dart';
import 'package:flutter_market/sepetim.dart';
import 'package:flutter_market/urunler.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
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
  late List<Widget> _icerikler;
  late int indexIcerik = 0;
  @override
  void initState() {
    _icerikler = [const Urunler(), const Sepetim()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orange),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Uçarak Gelsin",
          style: StyleConstants.instance.lTitle,
        ),
      ),
      body: _icerikler[indexIcerik],
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            UserAccountsDrawerHeader(
              arrowColor: Colors.amber,
              accountName: const Text("Kader"),
              accountEmail: const Text("kaderoral2147@gmail.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/11/22/06/05/girl-1848454__340.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              decoration: const BoxDecoration(color: Colors.orange),
            ),
            ListTile(
              title: const Text("Siparişlerim"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("İndirim Kuponlarım"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Ayarlar"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexIcerik,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Sepetim"),
        ],
        onTap: (int buttonNo) {
          setState(() {
            indexIcerik = buttonNo;
          });
        },
      ),
    );
  }
}
