import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // late String title;
  // late double price;
  // ProductDetailScreen(this.title, this.price, {Key? key}) : super(key: key);

  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    late String productId =
        ModalRoute.of(context)?.settings.arguments as String;

    final productData =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
    );
  }
}
