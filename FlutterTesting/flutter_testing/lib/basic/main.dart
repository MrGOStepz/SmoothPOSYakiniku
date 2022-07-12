import 'package:flutter/material.dart';
import 'package:flutter_testing/basic/answer.dart';
import 'package:flutter_testing/basic/question.dart';
import 'package:flutter_testing/basic/quiz.dart';
import 'package:flutter_testing/basic/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s favorite is your color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s is your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Dog', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s is your favorite instructor?',
      'answers': [
        {'text': 'GO', 'score': 10},
        {'text': 'GO', 'score': 5},
        {'text': 'GO', 'score': 3},
        {'text': 'GO', 'score': 1}
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      debugPrint('We have more questions!');
    } else {
      debugPrint('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(resultScore: _totalScore,resetHandler: _resetQuiz),
      ),
    );
  }
}
