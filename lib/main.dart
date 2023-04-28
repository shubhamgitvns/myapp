import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(VSJQuizApp());
}

class VSJQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Card(
              child: Text(
                "Quiz App",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.teal,
                ),
              )),
          centerTitle: true,
        ),



        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: VSJQuiz(),
          ),
        ),
      ),
    );
  }
}







class VSJQuiz extends StatefulWidget {
  @override
  _VSJQuizState createState() => _VSJQuizState();
}

class _VSJQuizState extends State<VSJQuiz> {
  List<Widget> scores=[
    const Icon(
        Icons.check,
        color: Colors.green
    )
    ,const Icon(
        Icons.close,
        color: Colors.red
    ),];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[ //Using Widget It is automatic create icons according,
        //your answer
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Question Will Come Here',
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
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),

              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                print("Submitted True");
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
             style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                print("Submitted False");
              },
            ),
          ),
        ),
        Row
          (
          children:scores, //Scores Row

        ),
      ],
    );
  }
}