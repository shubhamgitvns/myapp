import 'package:flutter/material.dart';
import 'package:myapp/staefull.dart';

import 'main.dart';
class VSJApp extends StatelessWidget {
  VSJHomePage vsjHomePage = VSJHomePage(title: 'Varanasi Software Junction');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Varanasi Software Junction',
      home: vsjHomePage,
    );
  }
}
