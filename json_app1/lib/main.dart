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
  final UserService _service = UserService();
  List<UsersModelData?> users = [];
  bool? isLoading;
  @override
  void initState() {
    super.initState();
    _service.getUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!.toList();
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Center(child: Text('Users')),
        ),
        body: isLoading == null
            ? const Center(child: CircularProgressIndicator())
            : isLoading == true
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            users[index]!.firstName! + users[index]!.lastName!),
                        subtitle: Text(users[index]!.email!),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(users[index]!.avatar!),
                        ),
                      );
                    },
                    itemCount: users.length,
                  )
                : const Center(
                    child: Text("Bir Sorun Oluştu"),
                  ),
      ),
    );
  }
}
