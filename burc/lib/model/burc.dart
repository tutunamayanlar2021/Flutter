class Burc {
  late final String _burcAdi;
  late final String burcTarihi;
  late final String _burcDetayi;
  late final String _burcKucukResim;
  late final String _burcBuyukResim;
  get burcAdi => _burcAdi;

  get getBurcTarihi => burcTarihi;

  get burcDetayi => _burcDetayi;

  get burcKucukResim => _burcKucukResim;

  get burcBuyukResim => _burcBuyukResim;

  Burc(this._burcAdi, this.burcTarihi, this._burcDetayi, this._burcKucukResim,
      this._burcBuyukResim);
  @override
  String toString() {
    return '$_burcAdi - $_burcBuyukResim';
  }
}
