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

  void sub() {
    try {
      result = (int.parse(a) - int.parse(b)).toString();
    } catch (e) {
      result = "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(  //single ListView include multiple container
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container( // first container
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container( //second container
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container( //third container
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
