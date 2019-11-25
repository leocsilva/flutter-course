import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What is your favorite color?',
        'answer': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What is your favorite animal?',
        'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion']
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < _questions.length
            ? Column(
                children: [
                  Question(
                    _questions[_questionIndex]['questionText'],
                  ),
                  ...(_questions[_questionIndex]['answer'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
    );
  }
}
