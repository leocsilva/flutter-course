import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final _text;

  MyTextWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }
}
