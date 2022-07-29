class UserRequest {
  String? email;
  String? password;
  bool? returnSecureToken;

  UserRequest({this.email, this.password, this.returnSecureToken});

  UserRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    returnSecureToken = json['returnSecureToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    data['email'] =email;
    data['password'] = password;
    data['returnSecureToken'] = returnSecureToken;
    return data;
  }
}
