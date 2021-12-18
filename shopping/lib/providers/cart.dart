import 'package:flutter/material.dart';

class CartItem {
  late String id;
  late String title;
  late int quantity;
  late double price;
  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items;

  Map<String, CartItem> get items {
    return {..._items as Map<String, CartItem>};
  }

  void addItem(String productId, String productTitle, double productPrice) {
    if (_items!.containsKey(productId)) {
      _items!.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      _items!.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: productTitle,
              quantity: 1,
              price: productPrice));
    }
  }
}
