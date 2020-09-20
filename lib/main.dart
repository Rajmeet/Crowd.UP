import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gh_crowdup/login_page.dart';
import 'package:gh_crowdup/authentication_service.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'checkin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crowd.UP GrizzHacks',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),     //check!!
    );
    //throw UnimplementedError();
  }
}
