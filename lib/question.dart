import 'package:flutter/material.dart';

class Question{
  String question="";
  String opta="";
  String optb="";
  String optc="";
  String optd="";
  String correctanswer="";

  //*****Create the constructor******
  Question(this.question,this.opta,this.optb,this.optc,this.optd,this.correctanswer);

  @override
  String toString() {
    return 'Question{question: $question, opta: $opta, optb: $optb, optc: $optc, optd: $optd, correctanswer: $correctanswer}';
  }
}
