import 'package:flutter/material.dart';
import 'package:myapp/utilities.dart';
class Controler extends StatefulWidget {
  //Call the class object in stateful widget
  Employee e=Employee(name:"Sachin",address:"Mumbai",age:50,
      post: "Batsman",salary:1000 );

  Controler({Key? key}) : super(key: key);

  @override
  State<Controler> createState() => _ControlerState();
  int value=0;

}

class _ControlerState extends State<Controler> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //call the class object
        Text("${widget.e.name}"),
        Text("${widget.e.address}"),
        Text("${widget.e.age}"),
        Text("${widget.e.salary}"),
        Text("${widget.e.post}"),
        //counter call
        Text("${widget.value}count"),

        Row(
          children: [

            Expanded(
                child:ElevatedButton(
                  child: Text("press"),
                  onPressed: () async{
                    await for (dynamic count in counter()) {
                      widget.value=count;
                      setState(() {

                      });
                      print(count);
                    }

                  },) )
          ],
        )
      ],


    );
  }
}
