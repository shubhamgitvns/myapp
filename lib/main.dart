import 'package:flutter/material.dart';
import 'package:myapp/utilities.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
          centerTitle: true,
        ),
        body: const MyStful(),
      ),
    ));
  }
}
class MyStful extends StatefulWidget {
  const MyStful({Key? key}) : super(key: key);
  
  @override
  State<MyStful> createState() => _MyStfulState();
}

class _MyStfulState extends State<MyStful> {
  String link =
      "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/01ba387cd5c7fef05815a30b72ad3a7b955f0d9e/data.json";

  int counter = 0;
  String message = "Clicked";
  String one="Name";
  String two="Roll no.";
  String three="Stream";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   children: [
        //     Expanded(
        //         child:Center(child: Text(""),))
        //   ],
        // )
        ElevatedButton(
            child: Text("Clicked $counter times."),
        onPressed: () async {
              counter++;
              dynamic data = await Utilities.f(link);
              print(data);
              print(data["name"]);
              one=data["name"];
              print(data["rollno"]);
              two=data["rollno"];
              three=data["stream"];
              print(data["stream"]);
              setState(()  {

              });
        }),

        Row(
          children:  [
            Expanded(child: Text(one)),
            Expanded(child: Text(two)),
            Expanded(child: Text(three)),
          ],
        )
      ],

    );
  }
}

