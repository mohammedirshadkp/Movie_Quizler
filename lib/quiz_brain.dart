import 'package:quizler/main.dart';
import 'Questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Questions> _questionBank = [
    Questions(q: 'Jon snow knows everything.', a: false),
    Questions(q: 'Ned stark committed suicide', a: false),
    Questions(q: 'Game of Thrones has 8 seasons', a: true),
    Questions(q: 'joffery is Not a bastard', a: false),
    Questions(q: 'there are 4 dragons in game of thrones', a: false),
    Questions(q: 'George R.R Martin is the author of Game of Thrones', a: true),
    Questions(q: 'Sansa Stark is better fighter than Arya stark', a: false),
    Questions(q: 'Jason Momoa Portrays Khal Drogo', a: true),
    Questions(q: 'Starks are the lords of Winterfell', a: true),
    Questions(q: 'Greyscale Is An Infectious Disease.', a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return quizBrain._questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return quizBrain._questionBank[_questionNumber].questionAnswers;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
