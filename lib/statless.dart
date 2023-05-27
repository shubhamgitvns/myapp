
import 'package:flutter/material.dart';
import 'package:myapp/utilities.dart';

import 'main.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Bar",style: TextStyle(color: Colors.white,fontSize: 30),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Name ${Utilities.currentbook.name}"),
          Text("Price ${Utilities.currentbook.price}"),
          Row(
            children: const [
              Expanded(child: Center(child: Text("Click the button",style: TextStyle(color: Colors.white,fontSize: 40),),))
            ],
          ),
          Center(
            child: Card(
              child: ElevatedButton(
                  child: const Text('First Page'),
                  onPressed: () async  {
                    dynamic retvalue = await asyncFunction();
                    print("Value = $retvalue}");
                        Navigator.pushNamed(context, '/second');
                  }),
            ),
          ),

          Center(
            child: Card(
              child: ElevatedButton(
                  child: const Text('Second Page'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  }),
            ),

          ),

        ],
      ),
    );
  }
}



