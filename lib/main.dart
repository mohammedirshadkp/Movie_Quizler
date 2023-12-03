import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int point = 0;
  List<Icon> Scorekeeper = [];
  void checkAnswer(bool userPicked) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(
      () {
        if (quizBrain.isFinished() == true) {
          if (userPicked == correctAnswer) {
            point++;
          }
          Alert(
            context: context,
            title: "Quiz Over",
            desc: "your score is :$point",
            content: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                  'https://assets-prd.ignimgs.com/2022/01/14/gameofthrones-allseasons-sq-1642120207458.jpg'),
            ),
          ).show();
          quizBrain.reset();
          point = 0;
          Scorekeeper = [];
        } else {
          if (correctAnswer == userPicked) {
            point++;
            Scorekeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            Scorekeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          quizBrain.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.green),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Row(children: Scorekeeper),
      ],
    );
  }
}
