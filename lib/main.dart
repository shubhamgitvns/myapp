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
        //Move In The Body
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //This sample demonstrates how to mix and match text with different text styles using the RichText Widget.
          // It displays the text "Hello bold world," emphasizing the word "bold" using a bold font weight.
          RichText(
            text: TextSpan(
              text: 'Hello ',
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' world!',style: TextStyle(fontSize: 40,color: Colors.cyan)),
              ],
            ),
          )

          //TODO: Add a Row here as your score keeper
        ],
      ),
    );
  }
}
