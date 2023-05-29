import 'package:flutter/material.dart';
void main(){
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

          children: [
            RichText(
              text: TextSpan(
                text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.cyan)),
                  TextSpan(text: ' world!',style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: 'Style',
                    style: TextStyle(color: Colors.black54,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                      ),
                ],
              ),
            ),


          ],
        ),


      ),
    );
  }
}


