import 'package:flutter/material.dart';
import 'package:myapp/utilities.dart';
class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String link =
      "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/5183d413177a29ff923e0d79bcd3fdad3b8411d0/array.json";
  dynamic data;
  int counter = -1, n = -1;
  int _selectedOption = 0;
  int point = 0;
  String b = "_selectedOption";
  String correctanswer = "";
  String message = "Clicked";
  String length = "length";
  String question = "Press the button to start the Quiz";
  String opt1 = "";
  String opt2 = "";
  String opt3 = "";
  String opt4 = "";
  int i = 0;
  List<Widget> scores = [];
  void _handleOptionChange(int? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  void addResult(_selectedOption) {
    int correcctanswerint = int.parse(correctanswer);
    bool isanswercorrect = _selectedOption == correcctanswerint;
    //scores.clear();
    if (isanswercorrect) {
      point++;
      scores.add(Icon(Icons.check, color: Colors.green));
    } else {
      scores.add(Icon(Icons.close, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  title: Text(
                    opt1,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                  value: 1,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: Text(opt2,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      )),
                  value: 2,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: Text(
                    opt3,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                  value: 3,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: Text(opt4,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      )),
                  value: 4,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
              ],
            ),
          ),
        ),

        //**************Pressed the button****************************************
        ElevatedButton(
            child: Text("click me $counter"),
            onPressed: () async {
              print("counter$counter");
              if (counter == -1) {
                data = await Utilities.f(link);
                data = data["questions"];
                n = data.length;

                counter++;
                question = data[counter % n]["question"];
                opt1 = data[counter % n]["opta"];
                opt2 = data[counter % n]["optb"];
                opt3 = data[counter % n]["optc"];
                opt4 = data[counter % n]["optd"];
                correctanswer = data[counter % n]["correctanswer"];
                setState(() {});
                return;
              }

              addResult(_selectedOption);
              counter++;
              question = data[counter % n]["question"];
              correctanswer = data[counter % n]["correctanswer"];

              if (counter > n - 1) {
                setState(() {});
                // addResult(_selectedOption);
                print("Test over");
                question = "Test over correct answer=$point";
                opt1 = "";
                opt2 = "";
                opt3 = "";
                opt4 = "";
                message = "Restart";
                return;
              }

              question = data[counter % n]["question"];
              opt1 = data[counter % n]["opta"];
              opt2 = data[counter % n]["optb"];
              opt3 = data[counter % n]["optc"];
              opt4 = data[counter % n]["optd"];
              correctanswer = data[counter % n]["correctanswer"];

              setState(() {});
            }),
        Row(
          children: scores,
        )
      ],
    );
  }
}
