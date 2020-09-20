import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthenticationService with ChangeNotifier{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();


  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(String email, String password) async {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyA6zdXngPiEXVZPobbi4RXcXji7N9JlwXs';
    //try {
      final response = await http.post(url, body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,

        }
      ));
      final responseData = json.decode(response.body);
      print(responseData);
      //await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    //}
    //on FirebaseAuthException catch (e) {
      //return e.message;
    //}
  }
}