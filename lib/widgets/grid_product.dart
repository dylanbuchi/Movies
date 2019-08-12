import 'package:flutter/material.dart';
import 'package:movies/screens/product_detail_screen.dart';

class GridProduct extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;

  GridProduct(
    this.id,
    this.title,
    this.imageUrl,
  );

  @override
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  var pressedIconLove = true;
  var pressedIconShoppingCart = true;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.page,
          );
        },
        child: Image.network(
          widget.imageUrl,
          fit: BoxFit.fill,
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
            widget.title,
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
