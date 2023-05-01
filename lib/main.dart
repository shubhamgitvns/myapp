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
          Row( // Column ka child
            children: [
              const Expanded(
                 child: Center(child: Text("shubham")),
                ),
                ]
              ),

                Row(
    children: [
      Expanded(
        child:Padding(padding: const EdgeInsets.all(15.0),
    child:ElevatedButton(
    onPressed: () {  },
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
