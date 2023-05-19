import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/product.dart';
import 'package:myapp/productpage.dart';

import 'downloader.dart';

class Utilities {
  static List<Widget> getWidgets(BuildContext context) {
    List<Widget> widgets = [];
    int n = products.length;
    print(n);

    for (int i = 0; i <= n - 1; i++) {
      widgets.add(
          Row(children: [Text("productno:- ${products[i]["productno"]}")]));
      widgets.add(Row(children: [
        Text("name:- ${products[i]["name"]}"),
        Center(
          child: Card(
            child: ElevatedButton(
                child: const Text('more'),
                onPressed: () {

                  print("hii");
                  Navigator.pushNamed(context, '/second');
                  print("pushed");
                }),
          ),
        ),
      ]));
      // widgets.add(Row(children: [Text("site:- ${products[i]["site"]}")]));
      // widgets.add(Row(children: [Text("site:- ${products[i]["link"]}")]));

    }
    return widgets;
  }

  static dynamic products = "";
}
