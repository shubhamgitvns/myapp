import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("App Bar",style: TextStyle(color: Colors.white,fontSize: 30),),
        centerTitle: true,
      ),
      body: Column(
        children: [
              Row(
                children: [
                  Expanded(child: Center(child: Text("Click the button",style: TextStyle(color: Colors.white,fontSize: 40),),))
                ],
              ),
                Center(
                child: Card(
    child: ElevatedButton(
    child: const Text('Internet Image'),
    onPressed: () {
    Navigator.pushNamed(context, '/second');
    }),
    ),
                ),

          Center(
            child: Card(
              child: ElevatedButton(
                  child: const Text('Download Image'),
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

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Local Image"),
        centerTitle: true,
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
              "https://3.bp.blogspot.com/-py5FbTZgvjo/YDi1bsQq16I/AAAAAAAACB0/BxejbJBcHA4AVfkB33WYC3YlVmxElM7BwCK4BGAYYCw/s1600/Varanasi%2BSoftware%2BJunction%2BPhone%2BLogo.png"
          ),
        ),
      ),
    );
  }
}
class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: Text("Download Image"),
        centerTitle: true,
      ),
      body: Center(
        child: Image(
          image: AssetImage("images/new.jpg"),
        ),

      ),
    );
  }
}


