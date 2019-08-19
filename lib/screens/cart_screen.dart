import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movies/providers/cart.dart' show Cart;
import 'package:movies/widgets/cart_item.dart';
import 'package:movies/providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const page = "cart_screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Items",
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      label: Text(
                        "\$ ${cart.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.title.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      onPressed: () {
                        Provider.of<Orders>(
                          context,
                          listen: false,
                        ).addOrderItem(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clearItems();
                      },
                      child: Text(
                        "BUY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => CartItem(
                cart.items.values.toList()[index].id,
                cart.items.values.toList()[index].price,
                cart.items.values.toList()[index].quantity,
                cart.items.values.toList()[index].title,
                cart.items.keys.toList()[index],
              ),
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
