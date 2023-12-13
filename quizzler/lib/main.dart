import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

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

 void checkAnswer(bool userPickedAnswer){
   bool correctAnswers = quizBrain.getCorrectAnswer();
   setState(() {
     if (quizBrain.isFinished() == true) {

       Alert(
         context: context,
         title: 'Finished!',
         desc: 'You\'ve reached the end of the quiz.',
       ).show();

       quizBrain.reset();

       scoreKeeper = [];
     }

     else {
       if (userPickedAnswer == correctAnswers) {
         scoreKeeper.add(Icon(
           Icons.check,
           color: Colors.green,
         ));
       } else {
         scoreKeeper.add(Icon(
           Icons.close,
           color: Colors.red,
         ));
       }
       quizBrain.nextQuestion();
     }
   });
   }


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
                quizBrain.getQuestionText(),
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
                checkAnswer(true);
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
               checkAnswer(false);
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
