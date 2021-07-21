import 'package:flutter_application_1/user_data.dart';

import 'user_data.dart';

class Hesap {
  final UserData userData;
  Hesap({required this.userData});
  double Hesaplama() {
    double sonuc;
    sonuc = 90 + userData.gunSayisi - userData.icilenSigara;
    sonuc = sonuc + (userData.boy / userData.kilo);

    if (userData.seciliCinsiyet == "KADIN") {
      return (sonuc - 5);
    } else
      return (sonuc + 6);
  }
}
