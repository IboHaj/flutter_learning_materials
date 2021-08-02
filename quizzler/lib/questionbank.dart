import 'question.dart';

class QuestionBank {
  int _questionCounter = 0;
  List<Question> qBank = [
    Question('Are you the big gay?', false),
    Question('Are you the small straight?', true),
    Question('Do we is have are big small pp gay?', true)
  ];

  void canQuestion() {
    if (_questionCounter + 1 < qBank.length) {
      _questionCounter++;
    } else {
      print('Can\'t give more questions');
    }
  }

  int counter() {
    return _questionCounter;
  }

  String text() {
    return qBank[_questionCounter].questionText;
  }
}
