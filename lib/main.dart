import 'package:flutter/material.dart';
import 'package:myapp/stateless.widget.dart';
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => FirstPage(),
    '/second': (context) => SecondPage(),
    '/third': (context) => ThirdPage(),


  },
));