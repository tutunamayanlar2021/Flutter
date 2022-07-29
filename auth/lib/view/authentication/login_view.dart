// ignore_for_file: use_build_context_synchronously

import 'package:auth/helper/shared_referance.dart';
import 'package:auth/model/user/user_request.dart';
import 'package:auth/services/firebase_servise.dart';
import 'package:auth/services/google_sign_in.dart';

import 'package:flutter/material.dart';

import '../../model/user/user_auth_error.dart';
import '../home/firebase_home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late String userName;
  late String password;
  late FirebaseService service = FirebaseService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(((val) {}));
    // print(GoogleSignHelper.instance.isHaveUser);
    if (SharedManager.manager.getKeys(SharedKey.TOKEN)!.isEmpty) {
      navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Key ::${SharedManager.manager.getKeys(SharedKey.TOKEN)}");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: UniqueKey(),
        onPressed: () async {
          await GoogleSignHelper.instance.signOut();
        },
        child: const Icon(Icons.exit_to_app),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userNameTextField(),
          emptySizdebox(),
          userPasswordTextfield(),
          emptySizdebox(),
          Wrap(spacing: 20, children: [
            customLoginFadBottun(),
            FloatingActionButton.extended(
              onPressed: () async {
                var data = await GoogleSignHelper.instance.signIn();
                if (data != null) {
                  var userData =
                      await GoogleSignHelper.instance.firebaseSignIn();
                  print(userData);
                  navigateToHome();
                  //debugPrint("TEL:${userData}");

                  // debugPrint("ACCESS_TOKEN :${userData!.accessToken}");
                  //debugPrint("ID_TOKEN :${userData.idToken}");

                }
              },
              label: const Text("Google Login"),
              icon: const Icon(
                Icons.outlined_flag,
              ),
              backgroundColor: Colors.green,
            ),
          ]),
        ],
      ),
    );
  }

  void navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const FirebaseHomeView(),
      ),
    );
  }

  FloatingActionButton customLoginFadBottun() {
    return FloatingActionButton.extended(
      heroTag: UniqueKey(),
      onPressed: () async {
        var result = await service.postUsers(UserRequest(
          email: userName,
          password: password,
          returnSecureToken: true,
        ));

        if (result is FirebaseAuthError) {
          debugPrint(result.error.message);
          if (result.error.message == null) {
            navigateToHome();
          }
        }
      },
      label: const Text("Login"),
      icon: const Icon(Icons.android),
    );
  }

  SizedBox emptySizdebox() {
    return const SizedBox(
      height: 10,
    );
  }

  TextField userPasswordTextfield() {
    return TextField(
      onChanged: (value) => setState(() {
        password = value;
      }),
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: "Password"),
    );
  }

  TextField userNameTextField() {
    return TextField(
      onChanged: (value) => setState(() {
        userName = value;
      }),
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: "Username"),
    );
  }
}
