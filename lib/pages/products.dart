import 'package:flutter/material.dart';
import 'package:shop/product_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(),
    );
  }
}
