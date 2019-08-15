import 'package:flutter/material.dart';
import 'package:movies/providers/cart.dart';
import 'package:movies/providers/orders.dart';
import 'package:movies/screens/cart_screen.dart';
import './screens/products_screen.dart';
import 'screens/order_screen.dart';
import 'screens/product_detail_screen.dart';
import 'providers/products.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: Orders(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cinema',
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.purple[800],
            accentColor: Colors.amber,
            buttonColor: Colors.grey,
            textTheme: TextTheme(
              title: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (ctx) => MyHomePage(),
            ProductScreen.page: (ctx) => ProductScreen(),
            ProductDetailScreen.page: (ctx) => ProductDetailScreen(),
            CartScreen.page: (ctx) => CartScreen(),
            OrderScreen.page: (ctx) => OrderScreen(),
          },
        ),
      );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Image.asset(
          'assets/images/movies.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.pushNamed(context, ProductScreen.page),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Home',
          ),
        ),
      );
}
