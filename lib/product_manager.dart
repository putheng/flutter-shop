import 'package:flutter/material.dart';
import 'package:shop/product_control.dart';
import 'package:shop/products.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    if(widget.startingProduct != null){
       _products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(Map<String, String> product)  {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductController(_addProduct)
        ),
        Expanded(
          child: Products(_products)
        )
      ],
    );
  }
}
