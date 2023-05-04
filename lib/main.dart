import 'package:flutter/material.dart';

void main() {
 runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
   '/': (context) => QuizOne(),
   '/second': (context) => QuizTwo(),
   '/third': (context) => QuizThree(),

  },
 ));
}

//*******************************Quiz One start************************************

class QuizOne extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
   backgroundColor: Colors.teal,
   appBar: AppBar( //App bar one*******************************************
    centerTitle: true,
    title: const Text('First Page'),
   ),
   body: Column(
    children: [
     Center(
      child: Card(
       child: ElevatedButton(
           child: const Text('Quiz 1'),
           onPressed: () {
            Navigator.pushNamed(context, '/second');
           }),
      ),
     ),
     //****************Second Evaluate button******************************
     Center(
      child: Card(
       child: ElevatedButton(
           child: const Text('Quiz 2'),
           onPressed: () {
            Navigator.pushNamed(context, '/third');
           }),
      ),
     ),

    ],
   ),
  );
 }
}
//****************************Quiz One end***************************************

//***************************Quiz two start*************************************
class QuizTwo extends StatefulWidget {
 @override
 _QuizTwo createState() {
  return _QuizTwo();
 }
}

class _QuizTwo extends State<QuizTwo> {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
   backgroundColor: Colors.tealAccent,
   appBar: AppBar(
    centerTitle: true,
    title: const Text("Second Page"),
   ),
   body: Column(
    children: [],
   ),
  );
 }
}
//***************************Quiz two end**************************************

//***************************Quiz three start*************************************

class QuizThree extends StatefulWidget {
 @override
 _QuizThree createState() {
  return _QuizThree();
 }
}
class _QuizThree extends State<QuizThree> {
 @override
 Widget build(BuildContext context) {
  return Scaffold(
   backgroundColor: Colors.greenAccent,
   appBar: AppBar(
    centerTitle: true,
    title: const Text("Third Page"),
   ),
   body: Column(
    children: [],
   ),
  );
 }
}
