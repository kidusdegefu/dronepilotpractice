import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';


/// Main function in the file
/// 
/// Help with the code came from https://github.com/iampawan/FlutterQuizApp
class multipleChoiceQuiz extends StatefulWidget {
  const multipleChoiceQuiz({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<multipleChoiceQuiz> createState() => _multipleChoiceQuiz();
}

class _multipleChoiceQuiz extends State<multipleChoiceQuiz> {
//_ means private in dart
  var questionIndex = 0; // Keeps track of the amount of questions given
  var _totalScore = 0; // Keeps track of the total score of the user
  final questions = const [
    {
      "questionText": "Complete this sentence: Hello _____",
      'answers': [
        {'text': 'dude!', 'score': 0},
        {'text': 'world!', 'score': 2},
        {'text': 'mom', 'score': 0},
        {'text': 'dudes', 'score': 0},
      ],
    },
    {
      "questionText": "What does RAM stand for?",
      'answers': [
        {'text': 'Random Access Memory', 'score': 2},
        {'text': 'Ram Ate Memory', 'score': 0},
        {'text': 'Read Any Memory', 'score': 0},
      ]
    },
    {
      "questionText": "What does SSD stand for?",
      'answers': [
        {'text': 'Studle Swell Dude', 'score': 0},
        {'text': 'Super Sunny Day', 'score': 0},
        {'text': 'Solid State Door', 'score': 0},
        {'text': 'Solid State Drive', 'score': 2},
      ]
    }
  ];

  /// Adds up the score if the questionIndex is less than
  /// the total amount of questions
  void answerQuestion(int score) {
    if (questionIndex < questions.length) {}
    _totalScore = _totalScore + score;
    print(_totalScore);
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  /// Resets var questionIndex and _totalScore to zero when activated
  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  /// Used to lay out the UI of the application
  @override
  Widget build(BuildContext context) {
    //home is named arg

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Practice Quiz"),
        ),
        body: questionIndex < questions.length
            ? Quiz(answerQuestion, questions, questionIndex)
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
