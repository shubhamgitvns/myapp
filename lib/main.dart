import 'package:flutter/material.dart';

void main() => runApp(VSJApp());

class VSJApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return MaterialApp(
   debugShowCheckedModeBanner: false,
   title: 'Text and column', // Title
   theme: ThemeData(
    primarySwatch: Colors.teal,
   ),
   home: VSJHomePage(title: 'varanasi Software junction'),
  );
 }
}

class VSJHomePage extends StatefulWidget {
 VSJHomePage({Key? key, required this.title}) : super(key: key);
 String getTitle() {
  return "VSJ - Flex: ";
 }

 final String title;
 String display = "Varanasi Software Junction";

 @override
 VSJPageState createState() => VSJPageState();
}


class VSJPageState extends State<VSJHomePage> {
 List<Widget> widgets = [];
 String currenttext = "Null";
 addresult(){
  currenttext ="Prime";
  setState(() { //If you need see this massage than call setState()
  });
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   // appBar: AppBar(
   //   title: Text(widget.getTitle()),
   //   centerTitle: true,
   // ),
      body: Column(   // Column mens parent
       // mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Row(
              children: [
                Expanded(
                    child: Center(
                      child:Text(currenttext) ,))

              ],
            ),
           Row(
            children: [
             Expanded(
                 child:Padding(padding: const EdgeInsets.all(15.0),
                     child:ElevatedButton(
                         onPressed: () {
                           addresult();
                           print("hii");// This massage show in console
                         },
                         child: const Center(child:Text("submit",),)
                     )
                 )

             )

            ],

           ),


          ],
      ),
      );
 }
}