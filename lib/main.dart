import 'package:flutter/material.dart';
import 'package:myapp/utilities.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          centerTitle: true,
        ),
        body: const MyStful(),
      ),
    ));
  }
}

class MyStful extends StatefulWidget {
  const MyStful({Key? key}) : super(key: key);

  @override
  State<MyStful> createState() => _MyStfulState();
}

class _MyStfulState extends State<MyStful> {
  String link =
      "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/1a7bcf56243ba1d281301f13936c9c585273f7e5/array.json";

  int counter = -1;
  int _selectedOption=0;
  String message = "Clicked";
  String length = "length";
  String question = "Press the button to start the Quiz";
  String opt1 = "";
  String opt2 = "";
  String opt3 = "";
  String opt4 = "";
  int i = 0;
  void _handleOptionChange(int? value) {
    setState(() {
      _selectedOption = value!;
    });


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
                child: Text(question,
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                    title:  Text(opt1,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title:  Text(opt2,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title:  Text(opt3,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                    value: 3,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title:  Text(opt4,
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
            child: Text("Clicked $counter times."),
            onPressed: () async {
              counter++;
              dynamic data = await Utilities.f(link);
              data = data["questions"];
              print(data);
              print(data.runtimeType);
             int n = data.length;
              length = "N=$n";
              if(counter>=n)
                {
                  return;
                }
              question = data[counter % n]["question"];
              opt1 = data[counter % n]["opt1"];
              opt2 = data[counter % n]["opt2"];
              opt3 = data[counter % n]["opt3"];
              opt4 = data[counter % n]["opt4"];

              for (i; i <= n - 1; i++) {
                print(data[i]);
              }

              setState(() {});
            }),

      ]
    );
  }
}
