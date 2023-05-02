import 'package:flutter/material.dart';
import 'package:myapp/question.dart';

void main() => runApp(VSJApp());

class VSJApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: VSJHomePage(),
    );
  }
}

class VSJHomePage extends StatefulWidget {
  VSJHomePage({Key? key}) : super(key: key);

  @override
  VSJPageState createState() => VSJPageState();
}

class VSJPageState extends State<VSJHomePage> {
  int questionno = -1; // Initialize Questionno
  String buttonlabel = "Submit"; // Initialize button Text
  //String Option="";
  List<Question> questions = [ //Question list
    Question("What is the capital of India", "Lucknow", "Delhi", "Hukulgunj",
        "Pandaypur"),
    Question("Whear is situated The Sundarpur", "Hukulgunj", "Bhojubir",
        "Lunka", "Jaytpura"),
    Question("What is the full form of Cr", "Criminal recerch",
        "Class Representative", "Champak Roy", "Shubham"),
  ];
  String questiontext = "Start the Quiz";
  Question currentquestion = Question("", "", "", "", "");
  void nextquestion() { //Class method
    questionno++;
    print(questionno);
    if (questionno >= questions.length) {
      questiontext = "Test over"; // Here Question-text value change
      // Show the current question option null
      currentquestion.opta="";
      currentquestion.optb="";
      currentquestion.optc="";
      currentquestion.optd="";
      buttonlabel = "Restart"; // Here button-level value change
      questionno=-1; // Restart program
      return;
    }
    currentquestion = questions[questionno];
    questiontext = currentquestion.question;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
        centerTitle: true,
      ),
      body: Column(
        // Column mens parent
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(// Column ka child
              children: [
            Expanded(
              child: Center(child: Text(questiontext)),
            ),
          ]),
          Row(
            children:  [
              Expanded(
                child:
                Center(
                  child: Text(currentquestion.opta),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                child: Text(currentquestion.optb),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                child: Text(currentquestion.optc),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Center(
                child: Text(currentquestion.optd),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                          onPressed: () {                //OnPressed fun()
                            nextquestion();
                            setState(() {});
                            print(questionno);
                          },
                          child: Center(
                            child: Text(buttonlabel),
                          ))))
            ],
          ),
        ],
      ),
    );
  }
}
