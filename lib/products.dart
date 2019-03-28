import 'package:flutter/material.dart';

class Products extends StatelessWidget{
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index){
    return Card(
        child: Column(
          children: <Widget>[
            Image.asset(products[index]['image']),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(products[index]['title'])
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () => Navigator
                  .pushNamed<bool>(
                    context, '/product/' + index.toString()
                  ),
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