import 'package:flutter/material.dart';
import 'package:quizzler_clone/modals/questions.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _quesionCounter = 0;
  int _score = 0;
  List<bool> _resultsList = [];
  bool _isDisplayResultWidget = false;

  void _quesionCounterIncrement() {
    print(_quesionCounter);
    print(QuestionsList.questionsListData.length);
    if (_quesionCounter < (QuestionsList.questionsListData.length - 1)) {
      setState(() {
        _quesionCounter++;
      });
    } else {
      setState(() {
        _isDisplayResultWidget = true;
      });
    }
  }

  void _restartQuiz() {
    _quesionCounter = 0;
    _score = 0;
    _resultsList = [];
    _isDisplayResultWidget = false;
  }

  Widget get _displayResult {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Score = $_score',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          RaisedButton(
            color: Colors.green,
            child: Text(
              'Restart!',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () {
              setState(() {
                _restartQuiz();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _questionWidget(String questionData, bool answerData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionData,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (answerData == true) {
                  _resultsList.add(true);
                  _score++;
                } else {
                  _resultsList.add(false);
                }
                _quesionCounterIncrement();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (answerData == false) {
                  _resultsList.add(true);
                  _score++;
                } else {
                  _resultsList.add(false);
                }
                _quesionCounterIncrement();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget get _getScoreCard {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          ..._resultsList.map((element) {
            if (element == true) {
              return Icon(
                Icons.check,
                color: Colors.green,
              );
            } else {
              return Icon(
                Icons.cancel,
                color: Colors.red,
              );
            }
          }).toList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_isDisplayResultWidget)
          Expanded(
            child: _questionWidget(
              QuestionsList.questionsListData[_quesionCounter].questionData,
              QuestionsList.questionsListData[_quesionCounter].answerData,
            ),
          )
        else
          Expanded(
            child: _displayResult,
          ),
        _getScoreCard,
      ],
    );
  }
}
