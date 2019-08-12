import 'package:flutter/material.dart';
import 'package:movies/widgets/product_grid.dart';

class ProductScreen extends StatelessWidget {
  static const page = 'product_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cinema ZzZ',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ProductGrid(),
    );
  }
}
