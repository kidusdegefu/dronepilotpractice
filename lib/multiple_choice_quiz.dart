import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import './quiz.dart';

/// Main function in the file
/// 
/// Help with the code came from https://github.com/iampawan/FlutterQuizApp
class MultipleChoiceQuiz extends StatefulWidget {
  const MultipleChoiceQuiz({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MultipleChoiceQuiz> createState() => _MultipleChoiceQuiz();
}

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
    print(data);
    c = Colors.black;
    quiz = Quiz.fromJson(data);
    questionList = quiz.questionList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: fetchQuestions,
        child: FutureBuilder(
            future: fetchQuestions(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) return errorData(snapshot);
                  return questionLists();
              }
            }),
      ),
    );
  }

  Padding errorData(AsyncSnapshot snapshot) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error: ${snapshot.error}',
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Text("Try Again"),
            onPressed: () {
              fetchQuestions();
              setState(() {});
            },
          )
        ],
      ),
    );
  }

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
                      style: TextStyle(
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

class AnswerWidget extends StatefulWidget {
  final List<Questions> results;
  final int index;
  final String m;

  AnswerWidget(this.results, this.index, this.m);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  Color c = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.m == widget.results[widget.index].correctAnswer) {
            c = Colors.green;
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