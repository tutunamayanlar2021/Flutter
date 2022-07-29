import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  static late SharedPreferences _preferences;
  static SharedManager manager = SharedManager._privateConstructor();
  SharedManager._privateConstructor();

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  String? getKeys(SharedKey key) => _preferences.getString(key.toString()) ;

  Future<void> saveString(SharedKey key, String value) async {
    await _preferences.setString(key.toString(), value);
  }
}

enum SharedKey {
  // ignore: constant_identifier_names
  TOKEN;
}
