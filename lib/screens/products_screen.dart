import 'package:flutter/material.dart';
import 'package:movies/providers/cart.dart';
import 'package:movies/widgets/app_drawer.dart';
import 'package:movies/widgets/product_grid.dart';
import 'package:provider/provider.dart';

import 'package:movies/widgets/badge.dart';
import 'cart_screen.dart';

enum Filters {
  Favorites,
  Science_Fiction,
  Disney,
  Horror,
  Action,
  Drama,
  Comedy,
  Animation,
  All,
}

class ProductScreen extends StatefulWidget {
  static const page = 'product_screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var _showFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cinema Infinity',
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: PopupMenuButton(
              onSelected: (Filters popMenuItemValue) {
                setState(() {
                  if (popMenuItemValue == Filters.Favorites) {
                    _showFavorites = true;
                  } else {
                    _showFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Favorites'),
                  value: Filters.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Science Fiction'),
                  value: Filters.Science_Fiction,
                ),
                PopupMenuItem(
                  child: Text('Action'),
                  value: Filters.Action,
                ),
                PopupMenuItem(
                  child: Text('Animation'),
                  value: Filters.Animation,
                ),
                PopupMenuItem(
                  child: Text('Comedy'),
                  value: Filters.Comedy,
                ),
                PopupMenuItem(
                  child: Text('Disney'),
                  value: Filters.Disney,
                ),
                PopupMenuItem(
                  child: Text('Drama'),
                  value: Filters.Drama,
                ),
                PopupMenuItem(
                  child: Text('Horror'),
                  value: Filters.Horror,
                ),
                PopupMenuItem(
                  child: Text('Show all Movies'),
                  value: Filters.All,
                ),
              ],
            ),
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamed(CartScreen.page);
                });
              },
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showFavorites),
    );
  }
}
