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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products[index]['title'],
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Oswald'
                    ),
                  ),
                  SizedBox(width: 8.0,),
                  Text(
                    '\$'+ products[index]['price'].toString(),
                  )
                ],
              )
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.info),
                  color: Theme.of(context).accentColor,
                  onPressed: () => Navigator
                  .pushNamed<bool>(
                    context, '/product/' + index.toString()
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () => Navigator
                  .pushNamed<bool>(
                    context, '/product/' + index.toString()
                  ),
                ),
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