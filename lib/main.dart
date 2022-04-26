import 'package:flutter/material.dart';
import 'package:flutter_first_learning/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav colour?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
        {'text': 'Black', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 8},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your fav language?',
      'answers': [
        {'text': 'Spanish', 'score': 5},
        {'text': 'French', 'score': 6},
        {'text': 'English', 'score': 8},
        {'text': 'Tamil', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _answerbutton(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerbutton: _answerbutton,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore),
      ),
    );
  }
}
