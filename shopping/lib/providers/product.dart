import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  late String id;
  late String title;
  late String description;
  late double price;
  late String imageUrl;
  late bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
