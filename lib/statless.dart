import 'package:flutter/material.dart';
import 'package:myapp/staefull.dart';
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
        body: Controler(),


      ),
    );
  }
}