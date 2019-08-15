import 'package:flutter/material.dart';
import 'package:movies/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final margin_10 = const EdgeInsets.all(10);

  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  const CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
  );
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) =>
          Provider.of<Cart>(context, listen: false).removeItem(
        productId,
      ),
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        margin: margin_10,
        padding: const EdgeInsets.only(
          right: 20,
        ),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          size: 40,
        ),
        color: Colors.red[400],
      ),
      child: Card(
        margin: margin_10,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColor,
              child: FittedBox(
                child: Text(
                  '\$ $price',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text('$title'),
            subtitle: Text('Total: \$ ${price + quantity}'),
            trailing: Text(
              '$quantity x',
              style: const TextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
