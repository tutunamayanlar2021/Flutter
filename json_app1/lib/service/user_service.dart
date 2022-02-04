import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class UserService {
  final String url = "https://reqres.in/api/users?page=2";

  Future<UsersModel?> getUsers() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponce = UsersModel.fromJson(jsonDecode(response.body), "");
      return jsonResponce;
    } else {
      print("başarısız");
    }
    return null;
  }
}
