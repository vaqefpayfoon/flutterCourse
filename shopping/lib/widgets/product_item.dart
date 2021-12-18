import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // late String id;
  // late String title;
  // late String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return //Consumer<Product>(builder: (ctx, product, child) =>
        ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            //   return ProductDetailScreen(title, 0);
            // }));
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              color: Colors.orangeAccent,
              icon: Icon(product.isFavorite
                  ? Icons.favorite_outline
                  : Icons.favorite_border),
              tooltip: 'add to favorite',
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_bag),
            tooltip: 'add to shopping',
            onPressed: () {},
            color: Theme.of(context).secondaryHeaderColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
    //);
  }
}
