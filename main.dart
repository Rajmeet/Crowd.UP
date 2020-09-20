import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

//home_page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
          backgroundColor: Color(0xff1d1a1c),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80,0, 0),
                child: Image.asset('assets/logo.png'),
              ),
              Text(
                "READY TO UNLOCK REWARDS?",
                style: TextStyle(
                  color: Color(0xffffd5ad),
                  fontWeight: FontWeight.w800,
                  fontSize: 25,

                ),
              ),
              SizedBox(height: 100),
              RaisedButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                color: Color(0xffd94a19),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  "Login in or Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          )
      ),
    );


  }
}


// login

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


//share

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share"),
      ),
    );
  }
}


//check in

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = ('Check-In');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        backgroundColor: Color(0xff1d1a1c),
        appBar: AppBar(title: const Text(_title, style: TextStyle(color: Colors.orange)), backgroundColor: Color(0xff1d1a1c)),
        body: MyStatelessWidget(),
      ),
    );
  }
}


class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Would you like to check-in?', style: TextStyle(fontSize: 28, color: Colors.orange)),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              // Navigator.pull(context)// should go forward to event main screen
              print('Thank you for attending!');
            },
            child: const Text('Yes', style: TextStyle(fontSize: 20)),
            color: Colors.green,
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              //  Navigator.pop(context);  // This should go back to the list of events
            },
            child: const Text('No', style: TextStyle(fontSize: 20)),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

//authentication
class AuthenticationService {
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

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}