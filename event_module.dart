import 'package:flutter/material.dart';

void main() => runApp(Event());

class Event extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events Page',
      theme: ThemeData(
        // Theme of this part of the application.
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color(0xFF1d1a1c),
      ),
      home: eventPage(title: 'Events Nearby',),
    );
  }
}

class eventPage extends StatefulWidget {
  eventPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State.

  final String title;

  @override
  _eventPageState createState() => _eventPageState();
}

class _eventPageState extends State<eventPage> {

  Future<bool> _onBackPressed() {
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
          onWillPop: _onBackPressed,
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
                    onPressed: (){},
                    textColor: Colors.black26,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[

                            Colors.grey,
                            Colors.grey,
                            Colors.white10,
                            Colors.white30,
                            Colors.grey,


                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                          'Grizzhacks\n9/18 - 9/20\n500 Participants\nAll Goals Reached!                     ',
                          style: TextStyle(fontSize: 20)
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  RaisedButton(
                    onPressed: () {
                      return MaterialPageRoute(builder: (BuildContext context) => eventPage());
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[


                            Colors.green,
                            Colors.green,
                            Colors.lightGreen,
                            Colors.lightGreen,
                            Color(0xFF44FF11),

                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                          'Grizzhack After Party\n9/20 ( 10am - 10pm)\n113 Participants\nNext Goal:\nFree Pizza @ 125 Participants! ',
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
