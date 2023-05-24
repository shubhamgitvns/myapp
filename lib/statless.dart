import 'package:flutter/material.dart';
import 'package:myapp/staefull.dart';

import 'main.dart';
class VSJApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api", // this title work like a html title
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primaryColor: Colors.blue,
     ),
      home: const ComplexData(),
    );
  }
}

