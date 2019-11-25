import 'package:flutter/material.dart';

import './text.dart';
import 'textControl.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {

  var _text = 'This is my initial text...';
  var _newText = 'This is my updated text...';

  void _changeText() {
    setState(() {
      _text = _newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment #1'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(children: <Widget>[
            MyTextWidget(_text),
            TextControl(_changeText)
          ],
          ),
        ),
      ),
    );
  }
}
