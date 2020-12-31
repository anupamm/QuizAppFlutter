import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
// runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What type of animal is a seahorse?',
      'answers': [
        {'text': 'Crustacean', 'score': 0},
        {'text': 'Arachnid', 'score': 0},
        {'text': 'Fish', 'score': 1},
        {'text': 'Shell', 'score': 0}
      ]
    },
    {
      'questionText': 'What color are zebras?',
      'answers': [
        {'text': 'White with black stripes', 'score': 0},
        {'text': 'Black with white stripes', 'score': 1},
        {'text': 'Both of the above', 'score': 0},
        {'text': 'None of the above', 'score': 0}
      ]
    },
    {
      'questionText': 'What is a group of owls called?',
      'answers': [
        {'text': 'an Army', 'score': 0},
        {'text': 'a Bewilderment', 'score': 0},
        {'text': 'a Parliament', 'score': 1},
        {'text': 'a Surprise', 'score': 0}
      ]
    },
    {
      'questionText': 'How many arms (tentacles) do octopuses have?',
      'answers': [
        {'text': '8', 'score': 1},
        {'text': '10', 'score': 0},
        {'text': '12', 'score': 0},
        {'text': '20', 'score': 0}
      ]
    },
    {
      'questionText': 'How many pairs of wings do bees have?',
      'answers': [
        {'text': '4', 'score': 0},
        {'text': '2', 'score': 1},
        {'text': '3', 'score': 0},
        {'text': '1', 'score': 0}
      ]
    },
    {
      'questionText': 'What is an elephant hunted for?',
      'answers': [
        {'text': 'Skin', 'score': 0},
        {'text': 'Hair', 'score': 0},
        {'text': 'Teeth', 'score': 1},
        {'text': 'Ears', 'score': 0}
      ]
    },
    {
      'questionText': 'Which of the following animal lays eggs in water?',
      'answers': [
        {'text': 'Python', 'score': 0},
        {'text': 'Frog', 'score': 1},
        {'text': 'Cow', 'score': 0},
        {'text': 'Crocodile', 'score': 0}
      ]
    },
    {
      'questionText':
          'Which of the following animals eats both animals and plants?',
      'answers': [
        {'text': 'Bear', 'score': 1},
        {'text': 'Lion', 'score': 0},
        {'text': 'Monkey', 'score': 0},
        {'text': 'Fox', 'score': 0}
      ]
    },
    {
      'questionText': 'Which of the following animals hunts in packs?',
      'answers': [
        {'text': 'Cheetah', 'score': 0},
        {'text': 'Tiger', 'score': 0},
        {'text': 'Lion', 'score': 1},
        {'text': 'Leopard', 'score': 0}
      ]
    },
    {
      'questionText':
          'Which of the following animals is not found in polar regions?',
      'answers': [
        {'text': 'Reindeer', 'score': 0},
        {'text': 'Fox', 'score': 0},
        {'text': 'Seal', 'score': 0},
        {'text': 'Lizard', 'score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var abool = true;
    // abool = false;

    _totalScore = _totalScore + score;
    //_totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Animal Quiz'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
