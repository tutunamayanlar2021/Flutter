import 'package:auth/helper/shared_referance.dart';
import 'package:auth/view/authentication/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(); 
  await SharedManager.init();
  runApp(const MyApp());} 

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: LoginView(),
    );
  }
}
