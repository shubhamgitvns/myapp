import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());


}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("App"),
          centerTitle: true,
        ),
        body:Column(

    children: [
    Stack(
    children: <Widget>[
    // Stroked text as border.
    Text(
    'Greetings, planet!',
    style: TextStyle(
    fontSize: 40,
    foreground: Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 6
    ..color = Colors.blue[700]!,
    ),
    ),

    // Solid text as fill.
    Text(
    'Greetings, planet!',
    style: TextStyle(
    fontSize: 30,
    color: Colors.grey[300],
    ),
    ),
    ],
    ),
    ],
    ),
      ),
    );
  }
}
