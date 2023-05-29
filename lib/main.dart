import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("App"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox( //size box like a container
                  width: 200,

                  child: TextField(
                    keyboardType: TextInputType.number,// input type work in mobile keyboard
                      onChanged: (value) { //print entered value in console
                        print(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',//label text work like a placeholder in css
                      )),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 90, 70),//this is padding style (left)(top)(right)(bottom)
                  child: SizedBox(
                    width: 200,

                    child: TextField(

                      obscureText: true,// this is hide the input value
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                        )),
                  ),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,

                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'email',
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
