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
  final _questions = const [
    {
      'questionText': 'What\'s favorite is your color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s is your favorite animal?',
      'answers': ['Cat', 'Dog', 'Monkey', 'Rabbit']
    },
    {
      'questionText': 'What\'s is your favorite instructor?',
      'answers': ['Me', 'You', 'Are', 'Rabbit']
    }
  ];

  void _answerQuestion() {
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
            : const Result(),
      ),
    );
  }
}
