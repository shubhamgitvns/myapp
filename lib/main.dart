import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(VSJApp());
}
class VSJApp extends StatelessWidget //Statelesswidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        backgroundColor: Colors.purple,

      ),
    );
  }
}