import 'package:flutter/material.dart';

import 'package:movies/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:movies/providers/product.dart';

class ProductItem extends StatefulWidget {
/*   final String id;
  final String title;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.imageUrl,
  ); */

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  var pressedIconLove = true;
  var pressedIconShoppingCart = true;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.page,
            arguments: product.id,
          );
        },
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.all(0),
        child: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: pressedIconLove ? Colors.redAccent : Colors.grey[800],
            ),
            onPressed: () {
              setState(() {
                pressedIconLove = !pressedIconLove;
              });
            },
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
              color: pressedIconShoppingCart ? Colors.yellow : Colors.grey[800],
            ),
            onPressed: () {
              setState(() {
                pressedIconShoppingCart = !pressedIconShoppingCart;
              });
            },
          ),
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
