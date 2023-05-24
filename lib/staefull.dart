import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplexData extends StatefulWidget {
  const ComplexData({Key? key}) : super(key: key);

  @override
  State<ComplexData> createState() => _ComplexDataState();
}

class _ComplexDataState extends State<ComplexData> {
  var data;
  Future<void> getUserApi () async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(response.statusCode==200){
      data=jsonDecode(response.body.toString());
      print(response.body);
    }
    else{

    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex JSON App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child:FutureBuilder(
                future: getUserApi(),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Text("loading");
                  }else {
                    return Text(data[0]["name"].toString());
                  }
                },
              ) )
        ],
      ),
    );
  }
}
