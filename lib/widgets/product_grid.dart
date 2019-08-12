import 'package:flutter/material.dart';
import 'package:movies/classes/product.dart';
import 'package:provider/provider.dart';

import 'grid_product.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key key,
    @required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    Provider.of(context)
    return GridView.builder(
      itemBuilder: (context, item) => GridProduct(
        //builds the item id, title and image into the GridView
        products[item].id,
        products[item].title,
        products[item].imageUrl,
      ),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 0.7,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    );
  }
}
