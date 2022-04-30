// Donaven Harrington
import 'dart:math';
import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  //questions mostly came from: https://thelegaldrone.com/part-107-study-guide/
  // ignore: prefer_final_fields
  List<Question> _questionBank = [
    Question('The maxium groundspeed for a small UA is 87 knots', true),
    Question(
        'Using a model aircraft as a hobby is exclued from the requirements in part 107',
        true),
    Question(
        'You have to register your drone if it weighs over 50 pounds', false),
    Question(
        'A remote pilot certification allows you to fly multiple drones at the same time',
        false),
    Question(
        'Wind shear is the gradual change in wind speed/direction over a large area',
        false),
    Question(
        'Maneuverability deals with the amount of input required on the control to move the drone',
        false),
    Question(
        'With a remote pilot certification you can fly without a visual observer',
        true),
    Question(
        'Class E airspace is measured in feet above ground level (AGL)', true),
    Question('Class G is the only uncontrolled airspace', true),
    Question('Class C airspace is surface to 4,000 MSL (mean sea level)', true),
    Question('Class D airspace is busier then class B and C', false),
    Question('The farther east you go the larger the longitude number', false),
    Question('Class B airspace surrounds busy airports', true),
    Question('Radio communication is not used in air travel', false),
    Question('The MULTICOM frequency is always 122.9 MHz', true),
    Question('Air pressure is directly proportional to air density', true),
    Question(
        'IMSAFE stands for illness, medication, stress, alcohol, fatigue and emotion',
        true),
    Question(
        'The four forces acting on an airplace in flight are lift, gravity, thrust and drag.',
        false),
    Question(
        'Anti-Collision lights are required 15 minutes after sunset.', false),
    Question('You must be at least 18 to get a pilot licence', false),
    Question('Pilot position reports start and end with "where you are"', true),
    Question('The two types of airports are towerd and non-towered', true),
    Question(
        'Class A airspace starts at 20,000 feet MSL (mean sea level)', false),
    Question(
        'The avation alphabet skips over some of the letters in the English alphabet',
        false),
    Question(
        'PAVE stands for pilot-in-command, air quality, environment, and external conditions',
        false),
  ];

  randomize() {
    //fill 2 arrays with data from questionBank 1 with Questions and the other with answers
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

      //randomizes the questions
      var temp = tempQuestions[i];
      tempQuestions[i] = tempQuestions[n];
      tempQuestions[n] = temp;
      //randomizes the answers in the same way as the questions
      var temp2 = tempAnswer[i];
      tempAnswer[i] = tempAnswer[n];
      tempAnswer[n] = temp2;
    }
    /*
    // ignore: avoid_print
    print(tempQuestions);
    // ignore: avoid_print
    print(tempAnswer);
    */

    //adds questions and answers back into _questionBank
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

  String getQuestionNumber() {
    return ('Question ${_questionNumber + 1}:');
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
