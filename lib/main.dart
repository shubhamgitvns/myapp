import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text("App"),
          centerTitle: true,
        ),
        body: const Adder(),
      ),
    );
  }
}

class Adder extends StatefulWidget {
  const Adder({Key? key}) : super(key: key);

  @override
  State<Adder> createState() => _AdderState();
}

class _AdderState extends State<Adder> {
  String a = "", b = "";
  String result = "";
  void add() {
    try {
      result = (int.parse(a) + int.parse(b)).toString();
    } catch (e) {
      result = "";
    }
    setState(() {});
  }

  void sub(){
    try{
      result=(int.parse(a) - int.parse(b)).toString();
    }catch(e){
      result="";
    }
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              //size box like a container
              width: 200,

              child: TextField(
                  keyboardType: TextInputType
                      .number, // input type work in mobile keyboard
                  onChanged: (value) {
                    print(value);
                    a = value;
                   // calculate();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'A', //label text work like a placeholder in css
                  )),
            ),
            SizedBox(
              //size box like a container
              width: 200,

              child: TextField(
                  keyboardType: TextInputType
                      .number, // input type work in mobile keyboard
                  onChanged: (value) {
                    //print entered value in console
                    print(value);
                    b = value;
                   // calculate();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'B', //label text work like a placeholder in css
                  )),
            ),
            Text(result),
            ElevatedButton(
                onPressed:(){
                  add();
                  print(result);

            },
                child: Text("Add")
            ),

            ElevatedButton(
                onPressed:(){
                  sub();
                  print( result);

                },
                child: Text("Sub")
            ),
          ],
        ),
      ],
    );
  }
}
