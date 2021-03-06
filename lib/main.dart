import 'package:flutter/material.dart';
import 'package:shop/pages/auth.dart';
import 'package:shop/pages/product.dart';
import 'package:shop/pages/products.dart';
import 'package:shop/pages/products_admin.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product)  {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index){
    setState((){
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        fontFamily: 'Oswald'
      ),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductsAdminPage(_addProduct, _deleteProduct)
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElement = settings.name.split('/');
        if(pathElement[0] != ''){
          return null;
        }

        if(pathElement[1] == 'product'){
          final int index = int.parse(pathElement[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
              _products[index]['title'],
              _products[index]['image']
            )
          );
        }

        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products)
        );
      },
    );
  }
}
