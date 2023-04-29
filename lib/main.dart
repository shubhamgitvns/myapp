import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(VSJQuizApp());
}

class VSJQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold(
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
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: VSJQuiz(),
              ),
            ),
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
  String currentquestiontext = "Press any button to start the quiz";
  int questionno = -1;
  int correctanswers = 0;
  bool isTestOver = false;

  //Questions list
  List<Question> questions = [

    Question("What is the capital of India", "a")
  ];//Question list Bracket

  Question? currentquestion;
  List<Widget> scores = [];

  void setQuestion(String s ) {

    if (isTestOver) return;

    if (questionno == -1) {
      questionno++;
      currentquestion = questions[questionno];
      currentquestiontext = currentquestion!.question;
      return;
    }

    if (questionno >= questions.length - 1) {
      addResult(s);
      currentquestiontext = "Questions Over. Correct answers = $correctanswers";
      isTestOver = true;
      return;
    }

    addResult(s);
    questionno++;
    if (questionno <= questions.length - 1) {
      currentquestion = questions[questionno];
      currentquestiontext = currentquestion!.question;
    }

  }

  void addResult(String s) {
     bool iscorrect = s  == currentquestion!.correctAnswer;
     //Ans is two type first is true and second is false than,
     //it is a bool data type
    //scores.clear();
    if (iscorrect) {
      correctanswers++;
      scores.add(const Icon(Icons.check, color: Colors.green)); // create icon
    } else {
      scores.add(const Icon(Icons.close, color: Colors.red)); // create icon
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Expanded(
         // flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentquestiontext,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text( "A= Lukhnow",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.blue),),
            Text( "B=Delhi",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.blue),),


          ],
        ),

        // Text("B=No"),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(               //Button no.1
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'A',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  print("Submitted True");
                  setState(() {
                    // addResult(true);
                    setQuestion("a");
                  });
                }),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton( //Button no.2
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'B',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                print("Submitted False");
                setState(() {
                  // addResult(false);
                  setQuestion("b");
                });
              },
            ),
          ),
        ),
        Row(
          children: scores,
        ),
      ],
    );
  }
}

class Question {
  String question = "";
  String correctAnswer = "";
  Question(this.question, this.correctAnswer);
}