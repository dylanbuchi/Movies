import 'package:flutter/material.dart';
import 'package:movies/widgets/grid_product.dart';
import '../classes/product.dart';

class ProductScreen extends StatelessWidget {
  static const page = 'products_screen';
  final List<Product> products = [
    Product(
      id: 'p1',
      title: 'Maleficient',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://i.pinimg.com/564x/ef/6f/35/ef6f352c6ef54ac74d0104a9c231f97f.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Avatar',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://i.pinimg.com/564x/1d/42/8f/1d428fc1bb6d2c3528c02753d6b3559e.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Avengers',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://i.pinimg.com/564x/d6/a6/08/d6a608d0db69ed5b40b7dae2aa3a34bc.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Interstellar',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://i.pinimg.com/564x/ff/5b/05/ff5b05afa8de4271f922d2b9eccf61e7.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cinema ZzZ',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, item) => GridProduct(
          //builds the item id, title and image into the GridView
          products[item].id,
          products[item].title,
          products[item].imageUrl,
          products[item].price,
        ),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 0.7,
          crossAxisSpacing: 0,
          mainAxisSpacing: 70,
        ),
      ),
    );
  }
}
