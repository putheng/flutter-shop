import 'package:flutter/material.dart';

class ProductController extends StatelessWidget {
  final Function addProduct;

  ProductController(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({'title': 'Pizza', 'image': 'assets/food.jpg'});
      },
      child: Text('Add Produc'),
    );
  }
}