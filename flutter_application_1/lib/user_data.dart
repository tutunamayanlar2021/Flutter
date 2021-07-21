class UserData {
  String? seciliCinsiyet;
  double icilenSigara = 15;
  double gunSayisi = 3;
  int boy = 150;
  int kilo = 60;

  UserData(
      {required this.icilenSigara,
      required this.gunSayisi,
      required this.boy,
      required this.kilo,
      this.seciliCinsiyet});
}
