// import 'package:flutter/material.dart';
// import 'package:myapp/question.dart';
// import 'package:myapp/utilities.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return (MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("My App"),
//           centerTitle: true,
//         ),
//         body: const MyStful(),
//       ),
//     ));
//   }
// }
//
// class MyStful extends StatefulWidget {
//   const MyStful({Key? key}) : super(key: key);
//
//   @override
//   State<MyStful> createState() => _MyStfulState();
// }
//
// class _MyStfulState extends State<MyStful> {
//   List<Question> products = [];
//   Question? currentquestion;
//   String link =
//       "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/30f713d2bb134b8358810134384105b287c34f7c/product.json";
//   int counter = -1;
//   String message = "Clicked";
//   String length = "length";
//   String name = "Press the button to start the Quiz";
//   String price="";
//   int i = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column (
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Expanded(
//           flex: 1,
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Center(
//               child: Text("Bank= $name",
//                 style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//             ),
//           ),
//         ),
//         Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Center(
//                   child: Text("Account no: $price",
//                     style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//
//         //**************Pressed the button****************************************
//         ElevatedButton(
//             child: Text("Clicked $counter times."),
//             onPressed: () async {
//               counter++;
//               dynamic data = await Utilities.downloadquestion(link);
//               data = data["products"];
//               print(data);
//               print(data.runtimeType);
//               int n = data.length;
//               length = "N=$n";
//               for(i;i<=n-1;i++)
//               {
//                 name = data[i]["name"];
//                 price = data[i]["price"];
//
//                 products.add(Question(name,price));
//               }
//               products.add(Question("", ""));
//               print(products);
//
//               if(counter>=n)
//               {
//                 print("test over");
//                 name="Data over";
//                 price="";
//
//                 setState(() {
//
//                 });
//                 return;
//               }
//               currentquestion = products[counter];
//               name =currentquestion!.name;
//
//               setState(() {});
//             }),
//       ],
//     );
//   }
// }