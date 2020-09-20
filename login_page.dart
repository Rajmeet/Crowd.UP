import 'package:flutter/material.dart';
import 'package:gh_crowdup/authentication_service.dart';
import 'package:gh_crowdup/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gh_crowdup/share.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(hintText: "Enter Username", labelText: "Username"),
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Enter Password", labelText: "Password"),
                          controller: passwordController,
                          obscureText: true,
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {},
                child: Text("Sign In"),
                ),
                RaisedButton(
                  onPressed: () {
                    Firebase.initializeApp();
                    context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                  },
                child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

