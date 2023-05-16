import 'package:flutter/material.dart';

class Question{
  String name="";

  //*****Create the constructor******
  Question(this.name);


  @override
  String toString() {
    return 'Question{name: $name}';
  }
}
