import 'dart:convert';
import 'dart:io';
import 'package:auth/model/base/base_header.dart';
import 'package:http/http.dart' as http;

import '../model/base/base_model.dart';

class BaseService {
  // ignore: constant_identifier_names
  static const String FIREBASE_URL =
      "https://auth-d62d4-default-rtdb.europe-west1.firebasedatabase.app";
  static final BaseService _instance = BaseService._private();
  BaseService._private();
  static BaseService get instance => _instance;
  Future get<T extends BaseModel>(T model, String child,
      {Header? header}) async {
    final response = await http.get(Uri.parse("$FIREBASE_URL/$child.json"),
        headers: header?.toJson() as Map<String, String>?);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = (json.decode(response.body));
        if (data is Map) {
          //  return model.fromJson(data.map((key, value) => key));
          return model;

          ///Darklı
        } else if (data is List) {
          return data.map((e) => model.fromJson(e)).toList();
        }
        return data;
      case HttpStatus.unauthorized:
        return response;
      case HttpStatus.notFound:
        return "Not Found";

      default:
        return response;
    }
  }
}
