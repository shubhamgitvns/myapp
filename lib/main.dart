import 'dart:ui'; //android run permission

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold( //Scaffold like a structure other word it is a skeleton
        backgroundColor: Colors.blueAccent, //background color
        appBar: AppBar( //app nevi.. bar

          centerTitle: true, //text center
          title:  Text("Varanasi Software Junction"),
          backgroundColor: Colors.blueGrey, //appbar background color
        ),

        body:

        Center(child: Image(
          image: NetworkImage( //sorce code
              "https://3.bp.blogspot.com/-py5FbTZgvjo/YDi1bsQq16I/AAAAAAAACB0/BxejbJBcHA4AVfkB33WYC3YlVmxElM7BwCK4BGAYYCw/s1600/Varanasi%2BSoftware%2BJunction%2BPhone%2BLogo.png"),
        ),
        ),
      ),
    ),
  );
}
