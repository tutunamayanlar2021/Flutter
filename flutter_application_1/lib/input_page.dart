import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constant.dart';
import 'package:flutter_application_1/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MyContaier.dart';
import 'IconCinsiyet.dart';
import 'Constant.dart';
import 'result_page.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 15;
  double gunSayisi = 3;
  int boy = 150;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HAYAT',
          style: kMetinStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                    child: newRowOutlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainerWidget(
                    child: newRowOutlineButton("KİLO"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainerWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Haftada kaç gün spor yapıyorsunuz?",
                      style: kMetinStyle),
                  Text("${gunSayisi.round()}", style: kSayiStyle),
                  Slider(
                    value: gunSayisi,
                    onChanged: (double newValue) {
                      setState(() {
                        gunSayisi = newValue;
                      });
                    },
                    min: 0,
                    max: 7,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainerWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Günde kaç sigara içiyorsunuz?", style: kMetinStyle),
                  Text("${icilenSigara.round()}", style: kSayiStyle),
                  Slider(
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                    min: 0,
                    max: 30,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainerWidget(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    renk: seciliCinsiyet == "KADIN"
                        ? Colors.lightBlue[700]
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: "KADIN",
                      iconx: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainerWidget(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    renk: seciliCinsiyet == "ERKEK"
                        ? Colors.lightBlue[700]
                        : Colors.white,
                    child: IconCinsiyet(
                      cinsiyet: "ERKEK",
                      iconx: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              userData: UserData(
                                  boy: boy,
                                  seciliCinsiyet: seciliCinsiyet,
                                  kilo: kilo,
                                  gunSayisi: gunSayisi,
                                  icilenSigara: icilenSigara),
                            )),
                  );
                },
                child: Text("HESAPLA")),
          )
        ],
      ),
    );
  }

  Row newRowOutlineButton(String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(data, textAlign: TextAlign.center, style: kMetinStyle),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(data == "BOY" ? boy.toString() : kilo.toString(),
              textAlign: TextAlign.center, style: kSayiStyle),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 10,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    data == "BOY" ? boy++ : kilo++;
                  });
                  print("üsteki");
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    data == "BOY" ? boy-- : kilo--;
                  });
                  print("alttaki");
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
