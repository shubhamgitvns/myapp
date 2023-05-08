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
          title: const Text("App"),
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
      "/champaksworldcreate/320e5af5ea9dbd31597d220637885587/raw/99f8f7a4df34ae477dcceb62598aa0bdde9ef685/tfquestions.json";
  int counter = 0;
  String message = "Clicked ";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text("Clicked $counter times."),
          onPressed: () async {
            counter++;
            dynamic data = await Utilities.f(link);
            print(data);
            setState(() {});
          },
        ),
      ],
    );
  }
}
