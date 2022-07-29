import 'package:auth/helper/shared_referance.dart';
import 'package:auth/services/firebase_servise.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../model/student.dart';
import '../../model/user.dart';

class FirebaseHomeView extends StatefulWidget {
  const FirebaseHomeView({Key? key}) : super(key: key);

  @override
  State<FirebaseHomeView> createState() => _FirebaseHomeViewState();
}

class _FirebaseHomeViewState extends State<FirebaseHomeView> {
  late FirebaseService service;
  @override
  void initState() {
    super.initState();
    service = FirebaseService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: studentFutureBuilder,
    );
  }

  Widget get studentFutureBuilder => FutureBuilder(
        future: service.getStudent(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                var data = snapshot.data;
                if (snapshot.data is List) {
                  return _listStudent(snapshot.data);
                } else if (data is Response) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    SharedManager.manager.getKeys(SharedKey.TOKEN);
                    Navigator.of(context).pop();
                  });
                }
              }
              return notFoundWidget;

            default:
              return waittingWidget;
          }
        }),
      );

  Widget get userFutureBuilder => FutureBuilder<List<User>>(
        // future: service.postUsers(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                return _listUser(snapshot.data!);
              } else {
                return notFoundWidget;
              }

            default:
              return waittingWidget;
          }
        }),
      );
  Widget _listUser(List<User> list) => ListView.builder(
        itemBuilder: (context, index) {
          return _userCard(list[index]);
        },
        itemCount: list.length,
      );
  Widget _listStudent(list) => ListView.builder(
        itemBuilder: (context, index) {
          return _studentCard(list[index]);
        },
        itemCount: list.length,
      );

  Widget _userCard(User user) => Card(
        child: ListTile(
          title: Text(user.name.toString()),
        ),
      );
  Widget _studentCard(Student student) => Card(
        child: ListTile(
          title: Text(student.name.toString()),
          subtitle: Text(student.no.toString()),
        ),
      );

  Widget get notFoundWidget => const Center(
        child: Text("Not Found kuk"),
      );
  Widget get waittingWidget => const Center(
        child: CircularProgressIndicator(),
      );
}
