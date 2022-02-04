import 'package:flutter/material.dart';

import 'model/user_model.dart';
import 'service/user_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserService _service = UserService();
  List<UsersModelData?> users = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.getUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!.toList();
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]!.firstName! + users[index]!.lastName!),
              subtitle: Text(users[index]!.email!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index]!.avatar!),
              ),
            );
          },
          itemCount: users.length,
        ),
      ),
    );
  }
}
