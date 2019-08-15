import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String synopsis;
  final String trailer;
  bool isFavorite;

  Movie({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.synopsis,
    this.trailer,
    this.isFavorite = false,
  });

  void showFavorites() {}
}
