import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(Share());

class Share extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Page',
      theme: ThemeData(
        // Theme of this part of the application.
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color(0xFF1d1a1c),
      ),
      home: sharePage(title: 'Share This Event!',),
    );
  }
}

class Sharing extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharing Page',
      theme: ThemeData(
        // Theme of this part of the application.
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color(0xFF1d1a1c),
      ),
      home: sharingPage(title: 'Share This Event!',),
    );
  }
}

class sharePage extends StatefulWidget {
  sharePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _sharePageState createState() => _sharePageState();
}


class _sharePageState extends State<sharePage> {



  Future<bool> _onReturnPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Text("NO"),
          ),
          SizedBox(height: 16),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: Text("YES"),
          ),
        ],
      ),
    ) ??
        false;
  }


  //The above code calls first for the state of the screen to be reset
  //and changes the effected variables within.
  //Changing the state of the screen must me done in this manner, else
  //the change will not refresh itself to reflect this change

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called

      return WillPopScope(
        onWillPop: _onReturnPressed,
        child: new Scaffold(
        appBar: AppBar(
          // Here we take the value from the sharePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.


          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  return MaterialPageRoute(builder: (BuildContext context) => sharingPage());
                },
                textColor: Color(0xFFffd5ad),
                color: Color(0xFFd94a19),
                child: const Text(
                    'Email',
                    style: TextStyle(fontSize: 20)
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  return MaterialPageRoute(builder: (BuildContext context) => sharingPage());
                },
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                    'Text',
                    style: TextStyle(fontSize: 20)
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  return MaterialPageRoute(builder: (BuildContext context) => sharingPage());
                },
                textColor: Colors.white,
                color: Colors.lightBlueAccent,
                child: const Text(
                    'Twitter',
                    style: TextStyle(fontSize: 20)
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  return MaterialPageRoute(builder: (BuildContext context) => sharingPage());
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF3D77C1),
                        Color(0xFF3D57F1),
                        Color(0xFF3D77C1),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Facebook',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  return MaterialPageRoute(builder: (BuildContext context) => sharingPage());
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[

                        Colors.deepPurple,
                        Colors.deepPurple,
                        Colors.purple,
                        Colors.purple,
                        Color(0xFF4466FF),


                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      'Instagram',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}



class sharingPage extends StatefulWidget {
  sharingPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _sharingPageState createState() => _sharingPageState();
}

class _sharingPageState extends State<sharingPage> {



  //The above code calls first for the state of the screen to be reset
  //and changes the effected variables within.
  //Changing the state of the screen must me done in this manner, else
  //the change will not refresh itself to reflect this change

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
      Scaffold(
        appBar: AppBar(
          // Here we take the value from the sharePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.


            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[ const SizedBox(height: 30), Container(height: 30),
                IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => sharePage())
                    );
                  },
                ),
                Container(),
              ],

            )
        ),
      );
  }
}
