class Header {
  final String? key ;
  final String? value;
  Header( {
    required this.key,
    required this.value,
  });



  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['key'] = key!;
    data['value'] = value!;
    return data;
  }
}
