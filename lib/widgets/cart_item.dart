import 'package:flutter/material.dart';
import 'package:movies/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
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
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final margin_10 = const EdgeInsets.all(10);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) =>
          Provider.of<Cart>(context, listen: false).removeItem(
        widget.productId,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "The selected movie Will be deleted",
          ),
          content: Text(
            "The Movie ${widget.title} will be removed from your chart",
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => setState(() {
                Navigator.of(context).pop();
              }),
              child: Text(
                'No',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  Provider.of<Cart>(
                    context,
                    listen: false,
                  ).removeItem(
                    widget.productId,
                  );
                  Navigator.of(context).pop();
                });
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
      key: ValueKey(widget.id),
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
                  '\$ ${widget.price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text('${widget.title}'),
            subtitle: Text('Total: \$ ${widget.price + widget.quantity}'),
            trailing: Text(
              '${widget.quantity} x',
              style: const TextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
