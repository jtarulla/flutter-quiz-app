import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  Result(this.score, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (score <= 6) {
      resultText = 'You can do better than this!';
    } else if (score <= 9) {
      resultText = 'You\'ve done pretty well!';
    } else {
      resultText = 'You\'re AWESOME! Keep moving forward.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (Center(
            child: Text(
          resultPhrase,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ))),
        FlatButton(
          child: Text('Try it again'),
          textColor: Colors.blueAccent,
          onPressed: resetHandler,
        )
      ],
    );
  }
}
