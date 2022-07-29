import 'package:auth/model/base/base_model.dart';

class Student extends BaseModel {
  String? key;
  String? name;
  int? no;

  Student({this.key, this.name, this.no});

  Student.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    no = json['no'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['no'] = no;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {

    // throw UnimplementedError();
    return Student.fromJson(json);
  }
}
