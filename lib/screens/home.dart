import 'package:flutter/material.dart';
import 'package:movies/screens/products_screen.dart';
import 'package:movies/widgets/app_drawer.dart';
import 'package:movies/widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import 'package:movies/providers/products.dart';

class MyHomePage extends StatelessWidget {
  static const page = 'home_page';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(
      context,
      listen: true,
    );

    return Scaffold(
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: productData.items.length,
        itemBuilder: (_, index) => Column(
          children: <Widget>[
            UserProductItem(
              productData.items[index].title,
              productData.items[index].imageUrl,
              productData.items[index].id,
            ),
            Divider(),
          ],
        ),
/*               Image.asset(
          'assets/images/movies.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover, ), */
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.pushNamed(context, ProductScreen.page),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Home',
        ),
      ),
    );
  }
}
