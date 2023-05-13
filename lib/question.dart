import 'package:flutter/material.dart';

class Question{
  String bank="";
  String accountno="";
  String holder="";
  String amount="";


  //*****Create the constructor******
  Question(this.bank,this.accountno,this.holder,this.amount);


  @override
  String toString() {
    return 'Question{question: $bank,account.no:$accountno,holder:$holder,amount:$amount}';
  }
}
