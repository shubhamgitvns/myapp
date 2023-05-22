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

//Create the class which name is product detail its work show the product data on the server
class ProductDeatil extends StatefulWidget {
  const ProductDeatil({Key? key}) : super(key: key);

  @override
  State<ProductDeatil> createState() => _ProductDeatilState();
}

class _ProductDeatilState extends State<ProductDeatil> {
//create the var using in json file
   dynamic img="";
   dynamic productno = "";
   dynamic name="";
   dynamic price="";
   dynamic size="";
   dynamic color="";


  @override
  Widget build(BuildContext context) {
    //Assign the json data in the var and show on the server
    productno=Utilities.productdetail["img"];
    productno=Utilities.productdetail["productno"];
    name=Utilities.productdetail["name"];
    price=Utilities.productdetail["price"];
    size=Utilities.productdetail["size"];
    color=Utilities.productdetail["color"];

    return Column(
      children: [
        Image.network("https://avatars.githubusercontent.com/u/77607083?s=200&v=4"),
        Text("Product no:-$productno"),
        Text("Product name:-$name"),
        Text("Price:-$price"),
        Text("Size:-$size"),
        Text("Color:-$color"),
      ],
    );
  }
}


