import 'package:flutter/material.dart';
import 'package:myapp/quizapp.dart';

class QuizOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar( //App bar one *******************************************
        centerTitle: true,
        title: const Text('First Page'),
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
                  child: const Text('Quiz 1'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  }),
            ),
          ),
          Center(
            child: Card(
              child: ElevatedButton(
                  child: const Text('Quiz 2'),
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



class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

     return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Quiz app"),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
        body: const QuizApp(),
      ),
    ));
  }
}




class QuizThree extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz app"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: QuizApp(),
      ),
    ));
  }
}








