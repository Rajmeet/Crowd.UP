import 'package:flutter/material.dart';
import 'package:gh_crowdup/authentication_service.dart';
import 'package:gh_crowdup/event_module.dart';
import 'package:gh_crowdup/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  //final TextEditingController emailController = TextEditingController();
  //final TextEditingController passwordController = TextEditingController();

  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (input) {
                              if (input.isEmpty){
                                // ignore: missing_return
                                return 'Please Enter Email';
                              }
                            },
                            onSaved: (input) => _email = input,
                            decoration: InputDecoration(hintText: "Enter Username", labelText: "Username"),
                            //controller: emailController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (input) {
                              if (input.isEmpty || input.length<6){
                                return 'Please Enter a Valid Password';
                              }
                            },
                            onSaved: (input) => _password = input,
                            decoration: InputDecoration(hintText: "Enter Password", labelText: "Password"),
                            //controller: emailController,
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    onPressed: signIn,
                    child: Text("Sign In")
                ),
                RaisedButton(
                  onPressed: signUp,
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        print('yay');
      }
      catch (e) {
        print('here');
        //print(e.message);
      }
    }
  }

  Future<void> signUp() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Event()));
        //Navigator.of(context).pop();
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Share()));
        print('yay2');
      }
      catch (e) {
        print('here');
        //print(e.message);
      }
    }
  }


}

