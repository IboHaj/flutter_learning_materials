class Question {
  int questionNumber;
  String questionText;
  bool questionAnswer;

  Question(this.questionText, this.questionAnswer) {}

  void atQuestionText() {
    print(questionText);
  }

  void atQuestionAnswer() {
    print(questionAnswer);
  }
}
