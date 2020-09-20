import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gh_crowdup/login_page.dart';
import 'package:gh_crowdup/authentication_service.dart';
import 'share.dart';
import 'home_page.dart';

void main()  => runApp(MaterialApp(
  title: "Crowd.UP GrizzHacks",
  home: HomePage(),
  theme: ThemeData(
    primarySwatch: Colors.purple,
  ),
));

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();


    if (firebaseUser != null) {
      return Share();
    }
    return LoginPage();
  }
}
