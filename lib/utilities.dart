import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/product.dart';
import 'package:myapp/productpage.dart';

import 'downloader.dart';

class Utilities {
  static dynamic productdetail = "";
  static List<Widget> getWidgets(BuildContext context) {
    List<Widget> widgets = [];
    int n = products.length;
    print(n);

    for (int i = 0; i <= n - 1; i++) {
      var site = products[i]["site"];
      var link = products[i]["link"];

      widgets.add(Row(children: [Text("productno:- ${products[i]["productno"]}")]));
      widgets.add(Row(children: [
        Text("name:- ${products[i]["name"]}"),
        Center(
          child: Card(
            child: ElevatedButton(
                child: const Text('more'),
                onPressed: () async { //***********OnPressed method***************************
                  print("Site $site");
                  print("link $link");
   //*************Download the product just click the button on console************************
                  Utilities.productdetail =
                      await Downloader.download(site, link);
                  print(Utilities.productdetail);
                 //This is second page path
                   Navigator.pushNamed(context, '/second');
                }),
          ),
        ),
      ]));

    }
    return widgets;
  }

  static dynamic products = "";

}



