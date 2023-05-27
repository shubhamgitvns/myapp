import 'package:flutter/material.dart';

class VSJHomePage extends StatefulWidget {
  Book b = Book("Basic Python", 800, "Python");
  VSJHomePage({Key? key}) : super(key: key);

  @override
  VSJPageState createState() => VSJPageState();
}

class VSJPageState extends State<VSJHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("${widget.b.bookname}"),
          Text("${widget.b.price}"),
          Text("${widget.b.author}"),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.b.bookname += 'a';
                    widget.b.price += 1;
                    widget.b.author += 'b';
                    setState(() {});
                  },
                  child: Center(
                    child: Text("Press"),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Book {
  String bookname, author;
  int price;
  Book(this.bookname, this.price, this.author);
}
