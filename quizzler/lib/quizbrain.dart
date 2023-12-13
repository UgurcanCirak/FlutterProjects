import 'question.dart';

class QuizBrain {

  int questionNumber = 0;

  List<Question> questionBank = [
    Question(questionText: 'Flutter is the native programming language.',
        questionAnswer: false),
    Question(questionText: 'Linear regression analysis is used to predict the value of a variable based on the value of another variable',
        questionAnswer: true),
    Question(questionText: 'We need to develop a piece of code that is open to innovation.',
        questionAnswer: true),
    Question(questionText: 'The Fenerbahce is the biggest sport club in Turkey',
        questionAnswer: true),
    Question(questionText: 'Regression is very important for Machine Learning',
        questionAnswer: true),
    Question(questionText: '2 + 2 = 5', questionAnswer: false),
    Question(questionText: 'Yavuz Sultan Selim conquered Istanbul in 1456.',
        questionAnswer: false),
  ];

  void nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  }

  String getQuestionText() {
    return questionBank[questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }
  bool isFinished() {
    if (questionNumber >= questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
  }
}
