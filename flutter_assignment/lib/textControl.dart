import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {

  final Function _changeText;

  TextControl(this._changeText);

  @override
  Widget build(BuildContext context) {
    return RaisedButton (
      child: Text('Change text!'),
      onPressed: _changeText,
    );
  }
}