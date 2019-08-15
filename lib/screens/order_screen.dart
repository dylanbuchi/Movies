import 'package:flutter/material.dart';
import 'package:movies/providers/orders.dart' show Orders;
import 'package:movies/widgets/app_drawer.dart';
import 'package:movies/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String page = 'order_screen';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies Purchased",
        ),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: order.orderItem.length,
        itemBuilder: (context, index) => OrderItem(order.orderItem[index]),
      ),
    );
  }
}
