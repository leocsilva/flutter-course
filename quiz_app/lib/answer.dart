import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function _callback;
  final String _text;

  Answer(this._callback, this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(_text),
        onPressed: _callback,
      ),
    );
  }
}