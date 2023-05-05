import 'package:flutter/material.dart';
import 'package:myapp/question.dart';
import 'package:myapp/quiztwo.dart';

void main() {
 runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
   '/': (context) => QuizOne(),
   '/second': (context) => QuizTwo(),
   '/Third': (context) => QuizThree(),
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
//****************************Quiz One end***************************************

//***************************Quiz two start*************************************
class QuizTwo extends StatefulWidget {
const QuizTwo({Key? key}) : super(key: key);

@override
State<QuizTwo> createState() => _QuizTwoState();
}


class _QuizTwoState extends State<QuizTwo>{   //StatelessWidget body
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   debugShowCheckedModeBanner: false,
   home: SafeArea(
    child: Padding(
     padding: const EdgeInsets.all(8.0),
     child: Scaffold(
      appBar: AppBar(          //App bar body
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
 int questionno = -1;
 int correctAnswers = 0;
 String buttonlabel = "Submit";
 //String currentquestiontext = "Press any button to start the quiz";
 List<Widget> scores = [];

 List<Question> questions = [ //Question list
  Question("What is the sum of 12+5+3", "18", "20", "19",
      "21",2),
  Question("What is the answer of 2*2/2", "0", "3",
      "2", "1", 3),
  Question("What is the answer of 2+2/2", "0", "2",
 "3", "1",3),
 ];
 String questiontext = "Start the Quiz";
 Question currentquestion = Question("", "", "", "", "",0);
 TextStyle textStyle= const TextStyle(
  color: Colors.white,
  fontSize: 20.0,
 );
 void nextquestion(int b) { //Class method
  if(questionno==-1)
  {
   questionno++;
   currentquestion = questions[questionno];
   questiontext = currentquestion.question;
   currentquestion.opta;
   currentquestion.optb;
   currentquestion.optc;
   currentquestion.optd;
   setState(() {});
   return;
  }

  questionno++;
  print(questionno);
  if (questionno >= questions.length) {
   addResult(b);
   questiontext = "Test over .correctCorrect answers = $correctAnswers"; // Here Question-text value change
   // Show the current question option null
   currentquestion.opta="";
   currentquestion.optb="";
   currentquestion.optc="";
   currentquestion.optd="";
   buttonlabel = "Restart"; // Here button-level value change
   questionno=-1; // Restart program
   return;
  }
  addResult(b);
  currentquestion = questions[questionno];
  questiontext = currentquestion.question;
 }

 void addResult(int b) {
  bool _selectoption = b == currentquestion.correctAnswer;
  //scores.clear();
  if (_selectoption) {
   correctAnswers++;
   scores.add( Icon(Icons.check, color: Colors.green));
  } else {
   scores.add(Icon(Icons.close, color: Colors.red));
  }
 }


 int _selectedOption = 0;
 void _handleOptionChange(int ? value) {
  setState(() {
   _selectedOption =value! ;
  });
 }

 bool isstart = false; //confuse

 @override
 Widget build(BuildContext context) {
  return Column(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
   crossAxisAlignment: CrossAxisAlignment.stretch,
   children: <Widget>[
    Expanded(
     flex: 3,
     child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
       child: Text(
        questiontext,
        textAlign: TextAlign.center,
        style: textStyle,
       ),
      ),
     ),
    ),
    Expanded(
     flex: 5,
     child: Center(
      child: GridView.count(
       crossAxisCount: 2,
       childAspectRatio: 3.0,
       padding: const EdgeInsets.all(10.0),
       children: <Widget>[
        RadioListTile(
         title:  Text(currentquestion.opta,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 1,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
        RadioListTile(
         title:  Text(currentquestion.optb,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 2,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
        RadioListTile(
         title:  Text(currentquestion.optc,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 3,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
        RadioListTile(
         title:  Text(currentquestion.optd,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 4,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
       ],
      ),
     ),
    ),
    Expanded(
     flex: 2,
     child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
           primary: Colors.green,
           minimumSize: const Size.fromHeight(50),
          ),
          child:  Text(
           buttonlabel,
           style:  TextStyle(
            color: Colors.white,
            fontSize: 20.0,
           ),
          ),
          onPressed: () {       //onPressed
           nextquestion(_selectedOption);
           _selectedOption = 0;
           isstart = true;
           setState(() {

           });

           setState(() {});
           print(questionno);
          }),
     ),
    ),
    Row(
     children: scores,
    ),
   ],
  );
 }
}
//***************************Quiz two end**************************************

//**************************Quiz three start************************************
class QuizThree extends StatefulWidget {
 const QuizThree({Key? key}) : super(key: key);

 @override
 State<QuizThree> createState() => _QuizThreeState();
}


class _QuizThreeState extends State<QuizThree>{   //StatelessWidget body
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   debugShowCheckedModeBanner: false,
   home: SafeArea(
    child: Padding(
     padding: const EdgeInsets.all(8.0),
     child: Scaffold(
      appBar: AppBar(          //App bar body
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

        child: Quiz(), //**************This is child class if this class-name is yous in your app than change the class_name
       ),
      ),
     ),
    ),
   ),
  );
 }
}

class Quiz extends StatefulWidget {
 @override
 _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
 int questionno = -1;
 int correctAnswers = 0;
 String buttonlabel = "Submit";
 //String currentquestiontext = "Press any button to start the quiz";
 List<Widget> scores = [];

 List<Question> questions = [ //Question list
  Question("What is the capital of India", "Lucknow", "Delhi", "Hukulgunj",
      "Pandaypur",2),
  Question("Whear is situated The Sundarpur", "Hukulgunj", "Bhojubir",
      "Lunka", "Jaytpura", 3),
  Question("What is the full form of Cr", "Criminal recerch",
      "Class Representative", "Champak Roy", "Shubham",3),
 ];
 String questiontext = "Start the Quiz";
 Question currentquestion = Question("", "", "", "", "",0);
 TextStyle textStyle= const TextStyle(
  color: Colors.white,
  fontSize: 20.0,
 );
 void nextquestion(int b) { //Class method
  if(questionno==-1)
  {
   questionno++;
   currentquestion = questions[questionno];
   questiontext = currentquestion.question;
   currentquestion.opta;
   currentquestion.optb;
   currentquestion.optc;
   currentquestion.optd;
   setState(() {});
   return;
  }

  questionno++;
  print(questionno);
  if (questionno >= questions.length) {
   addResult(b);
   questiontext = "Test over .correctCorrect answers = $correctAnswers"; // Here Question-text value change
   // Show the current question option null
   currentquestion.opta="";
   currentquestion.optb="";
   currentquestion.optc="";
   currentquestion.optd="";
   buttonlabel = "Restart"; // Here button-level value change
   questionno=-1; // Restart program
   return;
  }
  addResult(b);
  currentquestion = questions[questionno];
  questiontext = currentquestion.question;
 }

 void addResult(int b) {
  bool _selectoption = b == currentquestion.correctAnswer;
  //scores.clear();
  if (_selectoption) {
   correctAnswers++;
   scores.add( Icon(Icons.check, color: Colors.green));
  } else {
   scores.add(Icon(Icons.close, color: Colors.red));
  }
 }


 int _selectedOption = 0;
 void _handleOptionChange(int ? value) {
  setState(() {
   _selectedOption =value! ;
  });
 }

 bool isstart = false; //confuse

 @override
 Widget build(BuildContext context) {
  return Column(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
   crossAxisAlignment: CrossAxisAlignment.stretch,
   children: <Widget>[
    Expanded(
     flex: 3,
     child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
       child: Text(
        questiontext,
        textAlign: TextAlign.center,
        style: textStyle,
       ),
      ),
     ),
    ),
    Expanded(
     flex: 5,
     child: Center(
      child: GridView.count(
       crossAxisCount: 2,
       childAspectRatio: 3.0,
       padding: const EdgeInsets.all(10.0),
       children: <Widget>[
        RadioListTile(
         title:  Text(currentquestion.opta,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 1,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
        RadioListTile(
         title:  Text(currentquestion.optb,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 2,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
        RadioListTile(
         title:  Text(currentquestion.optc,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 3,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
        RadioListTile(
         title:  Text(currentquestion.optd,
             style: const TextStyle(
              fontSize: 25.0,
              color: Colors.white,
             )),
         value: 4,
         groupValue: _selectedOption,
         onChanged: _handleOptionChange,
        ),
       ],
      ),
     ),
    ),
    Expanded(
     flex: 2,
     child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
           primary: Colors.green,
           minimumSize: const Size.fromHeight(50),
          ),
          child:  Text(
           buttonlabel,
           style:  TextStyle(
            color: Colors.white,
            fontSize: 20.0,
           ),
          ),
          onPressed: () {       //onPressed
           nextquestion(_selectedOption);
           _selectedOption = 0;
           isstart = true;
           setState(() {

           });

           setState(() {});
           print(questionno);
          }),
     ),
    ),
    Row(
     children: scores,
    ),
   ],
  );
 }
}