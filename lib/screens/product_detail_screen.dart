import 'package:flutter/material.dart';
import 'package:movies/providers/products_providers.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
/*   final String title;

  ProductDetailScreen(this.title); */
  static const page = 'product_detail_screen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
