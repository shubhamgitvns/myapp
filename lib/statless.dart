import 'package:flutter/material.dart';
import 'package:myapp/staefull.dart';

import 'main.dart';
class VSJApp extends StatelessWidget {
  VSJHomePage vsjHomePage = VSJHomePage(title: 'SWApi');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complex API',
      home: vsjHomePage,
    );
  }
}
