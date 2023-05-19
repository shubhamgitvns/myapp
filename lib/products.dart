import 'package:flutter/material.dart';
import 'package:myapp/utilities.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Column(children: Utilities.getWidgets(context));
  }
}

class ProductDeatil extends StatefulWidget {
  const ProductDeatil({Key? key}) : super(key: key);

  @override
  State<ProductDeatil> createState() => _ProductDeatilState();
}

class _ProductDeatilState extends State<ProductDeatil> {
  //final url = Uri.https("gist.githubusercontent.com", link, {});
  //String link="/shubhamgitvns/3935c8fe5f8899d7f4c5bb7a8bc9a175/raw/5219e76d03ad6f5639b9bd0c49bd90896e9061d3/shoe.json";
  //var productsarray = Utilities.products["products"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [Text("hello")],)
      ],
    );
  }
}
