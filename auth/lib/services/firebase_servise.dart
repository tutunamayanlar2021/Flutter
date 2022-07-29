// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:io';

import 'package:auth/helper/shared_referance.dart';
import 'package:auth/model/base/base_header.dart';
import 'package:auth/model/student.dart';

import 'package:auth/model/user/user_request.dart';
import 'package:auth/services/base_service.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../model/user/user_auth_error.dart';

class FirebaseService {
  // ignore: constant_identifier_names, non_constant_identifier_names
  static const String FIREBASE_URL =
      "https://auth-d62d4-default-rtdb.europe-west1.firebasedatabase.app";
  // ignore: constant_identifier_names
  static const String FIREBASE_AUTH_URL =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBxkE_ul_eQGK2vkLm8Ys2jZIKwJybB4_E";
  BaseService _service = BaseService.instance;
  Future postUsers(UserRequest userRequest) async {
    var json = jsonEncode(userRequest.toJson());
    final response = await http.post(Uri.parse(FIREBASE_AUTH_URL), body: json);

    switch (response.statusCode) {
      case HttpStatus.ok:
      //throw (response.body);

      default:
        var errorJson = jsonDecode(response.body);
        var error = FirebaseAuthError.fromJson(errorJson);
        return error;
    }
  }

  Future getStudent() async {
    var response = _service.get<Student>(Student(), "students",
        header: Header(
            key: 'auth',
            value: SharedManager.manager.getKeys(SharedKey.TOKEN)
            //header.keyheader.value;
            ));
    if (response is List<Student>) {
      print("okey");
    } else {
      Logger().e(response);
    }
    return Future.error(response);

    //  return response;
    /*final response = await http.get(Uri.parse("$FIREBASE_URL/students.json"));

    switch (response.statusCode) {
      case HttpStatus.ok:
        final data = (json.decode(response.body)) as Map;
        List<Student> studentList = [];
        data.forEach((key, value) {
          Student student = Student.fromJson(value);
          student.key = key;
          studentList.add(student);
        });

        return studentList;

      default:
        return Future.error(response.statusCode);
    }*/
  }
}
