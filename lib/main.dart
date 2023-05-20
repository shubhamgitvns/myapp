import 'package:flutter/material.dart';
import 'package:myapp/downloader.dart';
import 'package:myapp/productpage.dart';
import 'package:myapp/utilities.dart';

void main() async {
  //Download Api method
  //utilities.product is Utilities is class name and product is json file name
  Utilities.products = await Downloader.download("gist.githubusercontent.com", //Site name
      // Site link
      "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/b850a5460cddc68ef5eb95d369c4867e4d0d6f96/product.json");

  var productsarray = Utilities.products["products"]; //create the var productsarray store the products value
  print(productsarray);
  Utilities.products = productsarray; //json data come in the productarray var.
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const ProductPage(),
      '/second': (context) => const DeatilPage(),
    },
  ));
}
