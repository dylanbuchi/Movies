import 'package:flutter/material.dart';
import 'package:movies/providers/auth.dart';
import 'package:movies/providers/cart.dart';
import 'package:movies/providers/orders.dart';
import 'package:movies/screens/auth_screen.dart';
import 'package:movies/screens/cart_screen.dart';
import 'package:movies/screens/home.dart';
import './screens/products_screen.dart';
import 'screens/order_screen.dart';
import 'screens/product_detail_screen.dart';
import 'providers/products.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
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
        child: Consumer<Auth>(
          builder: (context, authData, _) => MaterialApp(
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
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                ),
              ),
            ),
            home: authData.isAuthData
                ? ProductScreen()
                : FutureBuilder(
                    future: authData.tryAutoLogin(),
                    builder: (context, authResult) =>
                        authResult.connectionState == ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen(),
                  ),
            routes: {
              AuthScreen.page: (context) => AuthScreen(),
              MyHomePage.page: (context) => MyHomePage(),
              ProductScreen.page: (context) => ProductScreen(),
              ProductDetailScreen.page: (context) => ProductDetailScreen(),
              CartScreen.page: (context) => CartScreen(),
              OrderScreen.page: (context) => OrderScreen(),
            },
          ),
        ),
      );
}
