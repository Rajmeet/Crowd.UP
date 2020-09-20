import 'package:flutter/material.dart';
import 'main.dart';
import 'login_page.dart';

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
