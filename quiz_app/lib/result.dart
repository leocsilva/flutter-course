import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function _resetQuiz;

  Result(this._totalScore, this._resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (_totalScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (_totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (_totalScore <= 16) {
      resultText = 'You are ... strange ?!';
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: _resetQuiz,
          )
        ],
      ),
    );
  }
}
