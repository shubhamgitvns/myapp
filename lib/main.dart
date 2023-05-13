import 'package:flutter/material.dart';
import 'package:myapp/question.dart';
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
          title: Text("My App"),
          centerTitle: true,
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
  List<Question> questions = [];
  Question? currentquestion;
  String link =
      "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/91ccd9c3b266cc82ecb4324287b9e7ea8009de20/data.json";

  int counter = -1;
  String message = "Clicked";
  String length = "length";
  String bank = "Press the button to start the Quiz";
  String accountno="";
  String holder="";
  String amount="";
  int i = 0;


  @override
  Widget build(BuildContext context) {
    return Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text("Bank= $bank",
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text("Account no: $accountno",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text("Account holder: $holder",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text("Amount: $amount",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),

          //**************Pressed the button****************************************
          ElevatedButton(
              child: Text("Clicked $counter times."),
              onPressed: () async {
                counter++;
                dynamic data = await Utilities.downloadquestion(link);
                data = data["questions"];
                print(data);
                print(data.runtimeType);
                int n = data.length;
                length = "N=$n";
                for(i;i<=n-1;i++)
                  {
                    bank = data[i]["bank"];
                    accountno = data[i]["account.no"];
                    holder = data[i]["holder"];
                    amount = data[i]["amount"];
                  questions.add(Question(bank, accountno, holder,amount));
                  }
                questions.add(Question("", "", "",""));
                print(questions);

                if(counter>=n)
                {
                  print("test over");
                  bank="Data over";
                  accountno="";
                  holder="";
                  amount="";
                  setState(() {

                  });
                  return;
                }
                currentquestion = questions[counter];
                bank =currentquestion!.bank;
                accountno = currentquestion!.accountno;
                holder =currentquestion!.holder;
                amount=currentquestion!.amount;
                setState(() {});
              }),
      ],
    );
  }
}
