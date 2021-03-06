import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import './quiz.dart';

/// Main function in the file
/// 
/// Author: Evan McCarthy
/// 
/// Help with the code came from https://github.com/iampawan/FlutterQuizApp
class MultipleChoiceQuiz extends StatefulWidget {
  const MultipleChoiceQuiz({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MultipleChoiceQuiz> createState() => _MultipleChoiceQuiz();
}

/// Contains the logic in displaying the quiz and its questions
class _MultipleChoiceQuiz extends State<MultipleChoiceQuiz> {
  late Quiz quiz;
  late List<Questions> questionList;
  late Color c;
  Random random = Random();
  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchQuestions() async {
    var file = await rootBundle.loadString('lib/multiple_choice_questions.json');
    var data = await jsonDecode(file);
    //print(data);
    c = Colors.black;
    quiz = Quiz.fromJson(data);
    questionList = quiz.questionList;
  }

  /// Displays the app bar and the ability to refresh
  /// the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: fetchQuestions,
        child: FutureBuilder(
            future: fetchQuestions(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return errorData(snapshot);
                  return questionLists();
              }
            }
          ),
      ),
    );
  }

  /// Displays an error if the application cannot
  /// fetch questions from the .json file
  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: const Text("Try Again"),
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  /// Lays out and displays questions from a .json file
  ListView questionLists() {
    return ListView.builder(
      itemCount: questionList.length,
      itemBuilder: (context, index) => Card(
            color: Colors.white,
            elevation: 0.0,
            child: ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      questionList[index].question,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              children: questionList[index].allAnswers.map((m) {
                return AnswerWidget(questionList, index, m);
              }).toList(),
            ),
          ),
    );
  }
}

/// This class manages the answer widget and the display of it
class AnswerWidget extends StatefulWidget {
  final List<Questions> results;
  final int index;
  final String m;

  const AnswerWidget(this.results, this.index, this.m, {Key? key}) : super(key: key);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

/// Displays either a correct or incorrect result depending on what the user
/// chooses
class _AnswerWidgetState extends State<AnswerWidget> {
  Color c = Colors.black;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget.results[widget.index].correctAnswer) {
            c = Colors.green;
            score = score + 1;
          } else {
            c = Colors.red;
          }
        });
      },
      title: Text(
        widget.m,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: c,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ResultsWidget extends StatefulWidget {
  const ResultsWidget({Key? key}) : super(key: key);
  
  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  int score = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  fetchResults();
                },
                child: const Text("Submit Answer"),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget fetchResults () {
  String totalScore = score.toString();
    return ListView.builder(
      itemBuilder: (context, index) => Card(
              color: Colors.white,
              elevation: 0.0,
              child: ExpansionTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Your score is:" + totalScore,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}