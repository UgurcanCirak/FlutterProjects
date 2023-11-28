import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blueAccent.shade700,
        ),
        body: _DicepageState(),
      ),
    ),
  );
}

class _DicepageState extends StatefulWidget {
  const _DicepageState({super.key});

  @override
  State<_DicepageState> createState() => _DicepageStateState();
}

class _DicepageStateState extends State<_DicepageState> {

  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDice(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      print('diceNumber1 = $leftDiceNumber');
      print('diceNumber2 = $rightDiceNumber');
    });
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
                  onPressed: (){
                    changeDice();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'))
          ),
          Expanded(
            child: TextButton(
                onPressed: (){
                 changeDice();
                },
                child:Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  }
}



