import 'package:flutter/material.dart';
import 'package:movies/providers/cart.dart';
import 'package:movies/screens/cart_screen.dart';
import './screens/products_screen.dart';
import 'screens/product_detail_screen.dart';
import 'providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cinema',
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.orange,
            accentColor: Colors.grey,
            buttonColor: Colors.grey,
            textTheme: TextTheme(
              title: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (ctx) => MyHomePage(),
            ProductScreen.page: (ctx) => ProductScreen(),
            ProductDetailScreen.page: (ctx) => ProductDetailScreen(),
            CartScreen.page: (ctx) => CartScreen(),
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          'assets/images/movies.JPG',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.more_horiz,
          size: 30,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            Navigator.pushNamed(context, ProductScreen.page);
          });
        },
      ),
      appBar: AppBar(
        title: Text('Cinema Home'),
      ),
    );
  }
}
