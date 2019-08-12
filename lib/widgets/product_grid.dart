import 'package:flutter/material.dart';
import 'package:movies/widgets/product_items.dart';
import 'package:provider/provider.dart';
import 'package:movies/providers/products_providers.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = productData.items;
    return GridView.builder(
      itemBuilder: (context, item) => ChangeNotifierProvider.value(
        //builder: (ctx) => products[item],
        value: products[item],
        child: ProductItem(
            //builds the item id, title and image into the GridView
/*           products[item].id,
          products[item].title,
          products[item].imageUrl, */
            ),
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
