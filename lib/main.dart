import 'package:flutter/material.dart';

void main() {
  runApp(VSJQuizApp());
}
// StatelessWidget Class........................
class VSJQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Remove the banner
      home: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scaffold( // Scaffold means Structure related the app
            appBar: AppBar( // Appbar
              backgroundColor: Colors.teal,
              title: const Card(
                  child: Text(
                    "My Quiz App", //Appbar tital

                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.teal,
                    ),
                  )),
              centerTitle: true, // Move the Center in row the text
            ),
            backgroundColor: Colors.grey.shade900,
            //Enter the Body part.............................
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
//StatefulWidget Class.............................
class VSJQuiz extends StatefulWidget {
  @override
  _VSJQuizState createState() => _VSJQuizState();
}

class _VSJQuizState extends State<VSJQuiz> {
  String currentquestiontext = "Press any button to start the quiz";
  int questionno = -1; //if the start the question than the question no. increase -1 to 0
  int correctanswers = 0; // Starting correct answer score 0
  bool isTestOver = false;
  List<Question> questions = QuestionArray.questions;
  Question? currentquestion;
  List<Widget> scores = [];



  void setQuestion(String s) {
    //isTestOver=false;
    //questionno=-1;
    //scores.clear();

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
    bool iscorrect = s == currentquestion!.correctAnswer;
    //scores.clear();
    if (iscorrect) {
      correctanswers++;
      scores.add(const Icon(Icons.check, color: Colors.green));
    } else {
      scores.add(const Icon(Icons.close, color: Colors.red));
    }
  }

  String _selectedOption = "";
  void _handleOptionChange(String? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

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
        Expanded(
          flex: 5,
          child: Center(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3.0,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                RadioListTile(
                  title: const Text('Lucknow',
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                  value: 'option 1',
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: const Text('Delhi',
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                  value: 'Option 2',
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: const Text('Merethe',
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                  value: 'Option 3',
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: const Text('Goa',
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      )),
                  value: 'Option 4',
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
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  print("Submitted True");
                  setState(() {
                    // addResult(true);
                    setQuestion("Lucknow");
                  });
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

class QuestionArray {
  static List<Question> questions = [
    Question("What is the Capital of India", "Lucknow"),
    // Question("C++ is not an object oriented language.. T/F", false),
    // Question("Python has dictionary.. T/F", true),
    // Question("Hukulganj is the capital of Japan T/F", false)
  ];
}

class Question {
  String question = "";
  String correctAnswer = "";

  Question(this.question, this.correctAnswer);
}
