import 'package:flutter/material.dart';
import 'package:shop/pages/auth.dart';
import 'package:shop/pages/product.dart';
import 'package:shop/pages/products.dart';
import 'package:shop/pages/products_admin.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) => ProductsAdminPage()
      },
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElement = settings.name.split('/');
        if(pathElement[0] != ''){
          return null;
        }
        
        if(pathElement[1] == 'product'){
          final int index = int.parse(pathElement[2]);
          return MaterialPageRoute(
            builder: (BuildContext context) => ProductPage(
              products[index]['title'],
              products[index]['image']
            )
          );
        }

        return null;
      },
    );
  }
}
