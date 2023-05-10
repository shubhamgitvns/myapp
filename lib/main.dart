import 'package:flutter/material.dart';

import 'myapp.dart';

void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => QuizOne(),
     '/second': (context) => MyApp(),
     '/Third': (context) => QuizThree(),
  },
));

