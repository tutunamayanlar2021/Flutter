import 'package:auth/helper/shared_referance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignHelper {
  static final GoogleSignHelper _instance = GoogleSignHelper._private();
  GoogleSignHelper._private();
  static GoogleSignHelper get instance => _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

/*  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );*/

  Future<GoogleSignInAccount?> signIn() async {
    ///"? "konuldu
    final user = await _googleSignIn.signIn();
    if (user != null) {
      debugPrint(user.email);
      return user;
    } else {
      return null;
    }
  }
  bool get isHaveUser=> _googleSignIn.currentUser != null ?true:false;
   
    
    


  Future<GoogleSignInAuthentication?> googleAuthtencite() async {
    ///"? "konuldu
    if (await _googleSignIn.isSignedIn()) {
      final user = _googleSignIn.currentUser;
      final userData = await user!.authentication;

      return userData;
    }

    return null;
  }

  Future<GoogleSignInAccount?> signOut() async {
    ///"? "konuldu
    final user = await _googleSignIn.signOut();
    if (user != null) {
      debugPrint(user.email);
      return user;
    } else {
      return null;
    }
  }

  Future<User> firebaseSignIn() async {
    // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleAuthtencite();
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);
    final User user =
        (await _auth.signInWithCredential(credential)).user as User;
    debugPrint("USER_NAME :${user.displayName} ");
    var token = await user.getIdToken();
    await SharedManager.manager.saveString(SharedKey.TOKEN,token);
    //print(token);
    // debugPrint("TOKEN :${token}  ");

    return user;
  }
}
