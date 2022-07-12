import 'package:flutter/material.dart';
import 'package:flutter_testing/basic/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int) answerQuestion;

  const Quiz({Key? key,required this.questions,required this.answerQuestion,required this.questionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // return Answer(answerQuestion, answer['text'] as String);
          return Answer(() => answerQuestion(answer['score'] as int), answer['text'] as String);
        }).toList()
      ]);
  }
}
