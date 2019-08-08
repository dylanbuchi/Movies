import 'package:flutter/material.dart';
import './screens/products_screen.dart';
import './widgets/grid_product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.orange,
          accentColor: Colors.amber,
          buttonColor: Colors.grey,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )),
      home: MyHomePage(),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: null,
      ),
      appBar: AppBar(
        title: Text('Shopping'),
      ),
      body: Center(
        child: Text('SHOP'),
      ),
    );
  }
}
