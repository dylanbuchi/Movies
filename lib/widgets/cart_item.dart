import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(
        10,
      ),
      child: Padding(
        padding: EdgeInsets.all(
          6,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: FittedBox(
              child: Text(
                '\$ $price',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            '$title',
          ),
          subtitle: Text(
            'Total: \$ ${price + quantity}',
          ),
          trailing: Text(
            '$quantity x',
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
