import 'package:flutter/material.dart';

class Products extends StatelessWidget{
  final List<String> products;

  Products([this.products = const []]);

  Widget _buildProductItem(BuildContext context, int index){
    return Card(
        child: Column(
          children: <Widget>[
            Image.asset('assets/food.jpg'),
            Text(products[index]),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: (){},
                  child: Text('Detail')
                )
              ],
            )
          ],
        ),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    if(products.length > 0){
      return ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }else{
      return Center(
        child: Text('No products found, please add some'),
      );
    }
  }
}