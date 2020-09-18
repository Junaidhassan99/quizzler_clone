import 'package:flutter/cupertino.dart';

class Question {
  final String questionData;
  final bool answerData;

  const Question({
    @required this.answerData,
    @required this.questionData,
  });
}

class QuestionsList {
  static const questionsListData = [
    Question(
      questionData: 'World\'s longest river is Nile',
      answerData: true,
    ),
    Question(
      questionData: 'World\'s longest country by area is China',
      answerData: false,
    ),
    Question(
      questionData: 'Pakistan is located in Africa',
      answerData: false,
    ),
    Question(
      questionData: 'Earth has one moon',
      answerData: true,
    ),
    Question(
      questionData: 'New York is a state of USA',
      answerData: true,
    ),
  ];
}
