import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result({Key? key, required this.resultScore, required this.resetHandler}) : super(key: key);

  String get resultPhrase {
    String resultText;
    if(resultScore <= 8) {
      resultText = 'You are awesome and incocent!';
    } else if (resultScore <= 12){
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16){
      resultText = 'Pretty Haha';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart Quiz!'))
        ],
      ),
    );
  }
}
