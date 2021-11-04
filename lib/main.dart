import 'package:flutter/material.dart';
import 'package:quize_app/answer.dart';
import 'package:quize_app/question.dart';

void main() => runApp(Quiz());

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var question = [
    {
      'questionText': 'what is your fav color?',
      'answer': ['red', 'black', 'yellow', 'blue']
    },
    {
      'questionText': 'what is your fav animal?',
      'answer': ['cow', 'dog', 'cat', 'tiger']
    },
    {
      'questionText': 'what is your fav sports?',
      'answer': ['cricket', 'football', 'badminton', 'cram']
    },
    {
      'questionText': 'what is your fav laptop?',
      'answer': ['asus', 'hp', 'dell', 'lenevo']
    },
  ];
  var _answerIndex = 0;
  void _answerQuestion() {
    setState(() {
      _answerIndex = _answerIndex + 1;
    });

    print(_answerIndex);

    if (_answerIndex < question.length) {
      print('you have more questions');
    } else {
      print('you are done!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Quiz'),
        ),
        body: Center(
          child: _answerIndex < question.length
              ? Column(
                  children: [
                    Questions(question[_answerIndex]['questionText'] as String),
                    ...(question[_answerIndex]['answer'] as List<String>)
                        .map((answer) {
                      return Answers(_answerQuestion, answer);
                    }).toList(),
                  ],
                )
              : Center(
                  child: Text('This Quiz is completed'),
                ),
        ),
      ),
    );
  }
}
