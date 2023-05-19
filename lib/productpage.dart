import 'package:flutter/material.dart';
import 'package:myapp/products.dart';

class ProductPage extends StatelessWidget {
  void transfer()
  {

  }
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product page"),
      ),
      body:  Products(),
    );
  }
}

class DeatilPage extends StatelessWidget {
  const DeatilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produc Deatil Page"),
      ),
      body: ProductDeatil(),

    );
  }
}

