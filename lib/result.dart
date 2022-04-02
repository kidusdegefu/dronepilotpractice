import 'package:flutter/material.dart';

/// Contains the logic for the quiz 
/// when it ends
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback  resetQuizHandler;
  Result(this.resultScore, this.resetQuizHandler);
  String get resultPhrase {
    var resultText = "You Did it.";
    if (resultScore <= 30) {
      resultText = "You are awesome.";
    } else if (resultScore <= 12) {
      resultText = "Pretty Good!";
    } else if (resultScore <= 8) {
      resultText = "You are Strange.";
    } else {
      resultText = "You are not good!";
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
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          MaterialButton(
            child: const Text("Restart Quiz Game"),
            textColor: Colors.red,
            onPressed: resetQuizHandler,
          )
        ],
      ),
    );
  }
}
