import 'package:gh_crowdup/login_page.dart';
import 'package:gh_crowdup/main.dart';
import 'package:flutter/material.dart';

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
