import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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

  List<Widget> scoreKeeper = [];
  List<String> questions = [
    'Flutter is the native programming language.',
    'Linear regression analysis is used to predict the value of a variable based on the value of another variable',
    'We need to develop a piece of code that is open to innovation.',
    'MCBU',
  ];
  List<bool> answers = [
    false,
    true,
    true
  ];

   int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
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
                questions[questionNumber],
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
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightGreenAccent.shade700,
                textStyle: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                bool correctAnswers = answers[questionNumber];
                if(correctAnswers == true){
                  print('user got it right');
                }
                else{
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                bool correctAnswers = answers[questionNumber];
                if(correctAnswers == false){
                  print('user got it right');
                }
                else{
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
