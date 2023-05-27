import 'package:flutter/material.dart';
import 'package:myapp/staefull.dart';

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

