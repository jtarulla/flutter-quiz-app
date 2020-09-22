import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite moment of the day?',
      'answers': [
        {'text': 'Mornings', 'score': 4},
        {'text': 'Afternoons', 'score': 3},
        {'text': 'Late afternoons', 'score': 2},
        {'text': 'Nights', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s the animal that better represents you?',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Lion', 'score': 4},
        {'text': 'Dolphin', 'score': 3},
        {'text': 'Cat', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your code language of choice?',
      'answers': [
        {'text': 'JavaScript', 'score': 2},
        {'text': 'Pyhton', 'score': 5},
        {'text': 'Java', 'score': 3},
        {'text': 'C#', 'score': 4},
        {'text': 'I have no idea', 'score': 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Shakespeare'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questions: _questions,
              questionIndex: _questionIndex)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
