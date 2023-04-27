import 'package:flutter/material.dart';

void main() => runApp(VSJApp());

class VSJApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Varanasi Software Junction',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: VSJHomePage(title: 'Varanasi Software Junction'),
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
      appBar: AppBar(
        title: Text(widget.getTitle()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ColoredBox(
                      color: Colors.blueGrey,
                      child: Card(
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text("4"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ColoredBox(
                      color: Colors.blueGrey,
                      child: Card(
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text("6"),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}
