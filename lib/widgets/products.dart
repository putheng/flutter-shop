import 'package:flutter/material.dart';
import 'package:shop/widgets/product_card.dart';

class Products extends StatelessWidget{
  final List<Map<String, dynamic>> products;

  Products(this.products);
  
  @override
  Widget build(BuildContext context) {
    if(products.length > 0){
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) => 
        ProductCard(
          products[index],
          index
        ),
        itemCount: products.length,
      );
    }else{
      return Center(
        child: Text('No products found, please add some'),
      );
    }
  }
}