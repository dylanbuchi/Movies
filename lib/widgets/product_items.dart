import 'package:flutter/material.dart';

import 'package:movies/providers/cart.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  var _pressedIconLove = false;
  var _pressedIconShoppingCart = false;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Movie>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.page,
            arguments: product.id,
          );
        },
        child: Hero(
          tag: product.imageUrl,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: product.imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ), //Image.network(
        //product.imageUrl,
      ),
      footer: Padding(
        padding: const EdgeInsets.all(0),
        child: GridTileBar(
          leading: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 30,
                color: _pressedIconLove ? Colors.redAccent : Colors.grey[800],
              ),
              onPressed: () {
                setState(() {
                  _pressedIconLove = !_pressedIconLove;
                });
              }),
          trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
                color: _pressedIconShoppingCart
                    ? Colors.blue[500]
                    : Colors.grey[800],
              ),
              onPressed: () {
                setState(() {
                  _pressedIconShoppingCart = !_pressedIconShoppingCart;
                  cart.addItem(product.id, product.price, product.title);
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      action: SnackBarAction(
                        label: 'Cancel',
                        textColor: Colors.red,
                        onPressed: () => cart.cancelItem(product.id),
                      ),
                      content: Text(
                        '${product.title} added to the chart ! ',
                      ),
                      duration: Duration(
                        seconds: 2,
                      ),
                    ),
                  );
                });
              }),
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            '${product.title}   \$${product.price}',
            textAlign: TextAlign.center,
            style: const TextStyle(
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
