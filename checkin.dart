import 'package:flutter/material.dart';
//import 'main.dart';
//import 'home_page.dart'

void main() => runApp(MyApp());

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