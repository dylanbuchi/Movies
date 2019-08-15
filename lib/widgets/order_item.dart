import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies/providers/orders.dart' as just;
import 'dart:math';

class OrderItem extends StatefulWidget {
  final just.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(
        10.0,
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$ ${widget.order.amount}',
            ),
            subtitle: Text(
              DateFormat(
                'dd/MM/yyyy hh:mm',
              ).format(
                widget.order.dateTime,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () => setState(
                () => _expanded = !_expanded,
              ),
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              height: min(
                widget.order.product.length * 20.0 + 50.0,
                180.0,
              ),
              child: ListView(
                children: widget.order.product
                    .map((product) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              product.title,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${product.quantity}x \$ ${product.price}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
