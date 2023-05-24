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
      print(response.statusCode);
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
                    return Text("Loading");
                  }else {
                     return ListView.builder(
                       itemCount: data.length,
                         itemBuilder:(context,index){
                       return Card(
                         child: Column(
                           children: [
                             ReuseableRow(title: "id:-",value: data[index]["id"].toString(),),
                             ReuseableRow(title: "name:-",value: data[index]["name"].toString(),),
                             ReuseableRow(title: "username:-",value: data[index]["username"].toString(),),
                             ReuseableRow(title: "email:-",value: data[index]["email"].toString(),),
                             ReuseableRow(title: "addree:-",value: data[index]["address"].toString(),),
                             ReuseableRow(title: "street:-",value: data[index]["address"]["street"].toString(),),
                             ReuseableRow(title: "phone:-",value: data[index]["phone"].toString(),),
                             ReuseableRow(title: "website:-",value: data[index]["website"].toString(),),
                           ],
                         )
                       );
                     });
                    // Text(data[0]["username"].toString());
                  }
                },
              ) )
        ],
      ),
    );
  }
}
class ReuseableRow extends StatelessWidget {
  String title, value;
   ReuseableRow({Key? key,required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
      child:Row(
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title),
          Text(value),

        ]

      )
    );
  }
}

