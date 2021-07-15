import 'Soru.dart';

class TestVeri {
  int _soruDegis = 0;

  //"_" private olarak tanımlandırıyor.
  List<Soru> _soruBankasi = [
    Soru(
        soruMetni: "Titanic gelmiş geçmiş en büyük gemidir", soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır",
        soruYaniti: true),
    Soru(soruMetni: "Türkiyenin başkenti adanadır", soruYaniti: false),
    Soru(soruMetni: "izmir ülkedir", soruYaniti: false),
    Soru(
        soruMetni: "Kaju fıstığı aslında bir meyvenin sapıdır",
        soruYaniti: true),
    Soru(soruMetni: "Dünya düzdür", soruYaniti: false),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir",
        soruYaniti: true),
    Soru(soruMetni: "Fransızlar 80 demek için, 4 - 20 der", soruYaniti: true)
  ];
  String getSoruMetni() {
    return _soruBankasi[_soruDegis].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruDegis].soruYaniti;
  }

  void setSoruDegis(int index) {
    this._soruDegis = index;
  }

  void sonrakiSoru() {
    if (_soruDegis < _soruBankasi.length - 1) {
      _soruDegis++;
    }
  }

  bool testBittimi() {
    if (_soruDegis >= _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    _soruDegis = 0;
  }
}
