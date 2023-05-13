import 'package:flutter/material.dart';
import 'package:myapp/quizapp.dart';

class QuizOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar( //App bar one *******************************************
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text('Main Page'),
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Expanded(
                  child:Center(
                    child: Text("Select Yor Choice",style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white
                    ),),
                  ) )
            ],
          ),
          Center(
            child: Card(
              child: ElevatedButton(
                  child: const Text('Python Quiz'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  }),
            ),
          ),
          Center(
            child: Card(
              child: ElevatedButton(
                  child: const Text('C.Quiz'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Third');
                  }),
            ),
          ),

        ],
      ),
    );
  }
}


//*************python Quiz Appp*****************************

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

     return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Python Quiz"),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
        body: const QuizApp(),
      ),
    ));
  }
}


//*******************C Quiz App**********************************

class QuizThree extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("C.Quiz"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:const CQuizApp(),
      ),
    ));
  }
}
