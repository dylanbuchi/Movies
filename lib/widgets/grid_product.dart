import 'package:flutter/material.dart';

class GridProduct extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  GridProduct(this.id, this.title, this.imageUrl, this.price);

  @override
  _GridProductState createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  var pressedIconLove = false;
  var pressedIconShoppingCart = true;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        widget.imageUrl,
        fit: BoxFit.fill,
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(
            Icons.favorite,
            size: 30,
            color: pressedIconLove ? Colors.red : Colors.white,
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
            color: pressedIconShoppingCart ? Colors.white : Colors.greenAccent,
          ),
          onPressed: () {
            setState(() {
              pressedIconShoppingCart = !pressedIconShoppingCart;
            });
          },
        ),
        backgroundColor: Colors.black38,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
