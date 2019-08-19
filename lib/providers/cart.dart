import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  void clearItems() {
    _items = {};
    notifyListeners();
  }

  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach(
      (key, cardItem) {
        total += cardItem.price + cardItem.quantity;
      },
    );
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      //change quantitiy
      _items.update(
        productId,
        (exisitingCartItem) => CartItem(
          id: exisitingCartItem.id,
          title: exisitingCartItem.title,
          price: exisitingCartItem.price,
          quantity: exisitingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void cancelItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (currentCartItem) => CartItem(
            id: currentCartItem.id,
            title: currentCartItem.title,
            price: currentCartItem.price,
            quantity: currentCartItem.quantity - 1),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
