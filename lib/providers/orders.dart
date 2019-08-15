import 'package:flutter/material.dart';
import 'package:movies/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.product,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> get orderItem {
    return [..._orderItem];
  }

  void addOrderItem(List<CartItem> cartProduct, double total) {
    _orderItem.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          product: cartProduct,
        ));
    notifyListeners();
  }

  List<OrderItem> _orderItem = [];
}
