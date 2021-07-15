import 'package:flutter/material.dart';
import 'costant.dart';
import 'test.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey[850],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri testVeri_1 = TestVeri();

  SorulariKontrolEt(bool dogrumu) {
    if (testVeri_1.testBittimi()) {
      //alertdialog gösterilecek
      //indexi sıfırla
      //seçimleri sıfırla
      showMyDialog(this.context);
    } else {
      setState(() {
        if (dogrumu == testVeri_1.getSoruYaniti()) {
          secimler.add(dogruIcon);
        } else {
          secimler.add(kYanlisIcon);
        }
        testVeri_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                testVeri_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: secimler,
          spacing: 20,
          runSpacing: 20,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        primary: Colors.red, // background
                      ),
                      onPressed: () {
                        SorulariKontrolEt(false);
                      },
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        primary: Colors.green, // background
                      ),
                      onPressed: () {
                        SorulariKontrolEt(true);
                      },
                      child: Icon(
                        Icons.thumb_up,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ])),
        )
      ],
    );
  }

  showMyDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tebrikler.Testi bitirdiniz.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Başa dönmek için tıkla.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Başa dön.'),
              onPressed: () {
                setState(() {
                  testVeri_1.testiSifirla();
                  secimler = [];
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
