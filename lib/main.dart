import 'package:flutter/material.dart';
void main()=>runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent, //background color
       appBar: AppBar(
         backgroundColor: Colors.blueGrey,
         title: Text("Appbar"),
         centerTitle: true,
       ),
        body: Column(
          children: [
            Expanded(child: Center(child: Text("I am body"),))
          ],
        ),

      ),
    );
  }
}
