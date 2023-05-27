import 'package:flutter/material.dart';
import 'package:myapp/utilities.dart';

class SecondPage extends StatefulWidget  {
  Book b = Book("Mobile Development", 800);

  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: const Text("Second Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Text("Name ${Utilities.currentbook.name}"),
                Expanded(
                   child: ElevatedButton(
                      child: const Text('First Page'),
                      onPressed: () {
                        Utilities.currentbook.name +='a';
                        Navigator.pushNamed(context, '/second');
                      }),
                )
              ],
            ),

            Text("Price ${Utilities.currentbook.price}"),
          ],
        ));
  }
}

class ThirdPage extends StatefulWidget {
  Book b = Book("Mobile Development", 800);
  ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          title: const Text("Third Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text("Name ${Utilities.currentbook.name}"),
            Text("Price ${Utilities.currentbook.price}"),
          ],
        ));
  }
}

class Book {
  String name;
  int price;
  Book(this.name, this.price);
}
