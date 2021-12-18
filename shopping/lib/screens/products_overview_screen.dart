// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/products.dart';
import '../widgets/products_grid.dart';

enum FilterOption { Favorite, All }

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _showOnlyFavorite = false;
    final productsContainer = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == FilterOption.Favorite) {
                  productsContainer.showFavoritesOnly();
                  // _showOnlyFavorite = true;
                } else {
                  productsContainer.showAll();
                  // _showOnlyFavorite = false;
                }
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                        child: Text('only favorite'),
                        value: FilterOption.Favorite),
                    const PopupMenuItem(
                        child: Text('show all'), value: FilterOption.All),
                  ])
        ],
      ),
      body: ProductsGrid(_showOnlyFavorite),
    );
  }
}
