import 'package:flutter/material.dart';

class GridProduct extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  GridProduct(this.id, this.title, this.imageUrl, this.price);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
      footer: GridTileBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
