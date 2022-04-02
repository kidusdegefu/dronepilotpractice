import 'package:flutter/material.dart';

/// This class handles the UI properties of the answers
/// in the quiz
class Answer extends StatelessWidget {
  final VoidCallback  selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: MaterialButton(
        color: Colors.red,
        onPressed: selectHandler,
        textColor: Colors.white,
        child: Text(
          answerText,
        ),
      ),
    );
  }
}
