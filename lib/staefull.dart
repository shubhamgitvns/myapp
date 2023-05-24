import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List<Photos> photoslist=[]; //photo list array

Future<List<Photos>> getPhotos () async{ //getPhotos calling method
  final response =  await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));//link
  var data=jsonDecode(response.body.toString());
    //print(response.body);
  if(response.statusCode==200){
    print(response.statusCode);
    for(Map i in data){ //create the for loop show all array data
      Photos photos = Photos(title: i["title"], url: i["url"], id: i["id"]);//create the data key
      photoslist.add(photos); // add the data kes in photos list[]
    }
    return photoslist;
  }else{
    return photoslist;
  }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VSJ App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
        child:FutureBuilder( //data builder method
         future: getPhotos(),
           builder: (context,AsyncSnapshot<List<Photos>> snapshot){  //build the data using AsyncSnapshot
          return ListView.builder( // list view Builder
            itemCount: photoslist.length, //items length
              itemBuilder: (context,index){
            return ListTile(  //data list
              leading:CircleAvatar( //create img in circle structure
                backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                ),
              subtitle: Text(snapshot.data![index].id.toString()) ,
              title: Text(snapshot.data![index].title.toString()),
            );
          });
          })
          )

        ],
      ),
    );
  }
}

class Photos{
   String title,url;
   int id;
   //class constructor
   Photos({required this.title,required this.url,required this.id});

}

