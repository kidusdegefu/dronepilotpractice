/// Contains logic for how the quiz works
/// 
/// Author: Evan McCarthy
/// 
class Quiz {
  late int responseCode;
  late List<Questions> questionList;

  Quiz({required this.responseCode, required this.questionList});

  Quiz.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      questionList = <Questions>[];
      json['results'].forEach((v) {
        questionList.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    // ignore: unnecessary_null_comparison
    if (questionList != null) {
      data['results'] = questionList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// Takes data from the .json file and stores them into variables.
/// These variables are then stored in an List
class Questions {
  late String question;
  late String correctAnswer;
  late List<String> allAnswers;

  Questions({
    required this.question,
    required this.correctAnswer,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    correctAnswer = json['correct_answer'];
    allAnswers = json['incorrect_answers'].cast<String>();
    allAnswers.add(correctAnswer);
    allAnswers.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] = allAnswers;
    return data;
  }
}