//Donaven Harrington
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('True or False Quiz'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  void checkAnswer(bool userAnswer) {
    setState(() {
      bool correctAnswer = quizBrain.getQuestionAnswer();
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "END OF QUIZ",
          desc:
              "You've reach the end of the quiz. If you wish to play again, press reset button below",
          buttons: [
            DialogButton(
              child: const Text(
                "Reset Quiz",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  quizBrain.reset();
                  scoreKeeper = [];
                  Navigator.pop(context);
                  quizBrain.randomize();
                });
              },
              width: 120,
            )
          ],
        ).show();
      }
      if (userAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color c = Colors.white;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                ('${quizBrain.getQuestionNumber()}\n ${quizBrain.getQuestionText()}'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
                c = Colors.green;
                quizBrain.isFinished();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
                c = Colors.red;
                quizBrain.isFinished();
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
