import 'dart:math';

import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  // ignore: prefer_final_fields
  List<Question> _questionBank = [
    Question('t1', true),
    Question('t2', true),
    Question('t3', true),
    Question('t4', true),
    Question('t5', true),
    Question('t6', true),
    Question('t7', true),
    Question('t8', true),
    Question('t9', true),
    Question('t10', true),
    Question('f1', false),
    Question('f2', false),
    Question('f3', false),
    Question('f4', false),
    Question('f5', false),
    Question('f6', false),
    Question('f7', false),
    Question('f8', false),
    Question('f9', false),
    Question('f10', false),
  ];

  randomize() {
    //fill 2 arrays with data from questionBank
    var tempQuestions = [];
    var tempAnswer = [];
    for (var i = 0; i < _questionBank.length; i++) {
      tempQuestions.add(_questionBank[i].questionText);
      tempAnswer.add(_questionBank[i].questionAnswer);
    }

    var random = Random();

    // Go through all elementsof list
    for (var i = tempQuestions.length - 1; i > 0; i--) {
      // Pick a random number according to the lenght of list
      var n = random.nextInt(i + 1);

      var temp = tempQuestions[i];
      tempQuestions[i] = tempQuestions[n];
      tempQuestions[n] = temp;

      var temp2 = tempAnswer[i];
      tempAnswer[i] = tempAnswer[n];
      tempAnswer[n] = temp2;
    }

    // ignore: avoid_print
    print(tempQuestions);
    // ignore: avoid_print
    print(tempAnswer);

    for (var i = 0; i < _questionBank.length; i++) {
      _questionBank[i] = Question(tempQuestions[i], tempAnswer[i]);
    }
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    return _questionNumber = 0;
  }
}
