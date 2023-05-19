import 'package:flutter/material.dart';
import 'package:myapp/downloader.dart';
import 'package:myapp/productpage.dart';
import 'package:myapp/utilities.dart';

void main() async { //Download json method
  Utilities.products = await Downloader.download("site",
      "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/4d7a2dadc5e6ec4a5038aed31116f1ee0c599e7f/product.json");
  var productsarray = Utilities.products["products"];//create the var productsarray store the products value
 print(productsarray);
  Utilities.products = productsarray; //come out the json data in program
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const ProductPage(),
       '/second': (context) => const DeatilPage(),
    },
  ));
}
