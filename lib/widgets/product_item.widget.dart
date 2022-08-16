import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail.screen.dart';
import '../providers/products.provider.dart';
import '../providers/product.provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products productList = Provider.of<Products>(context);
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, productListen, _) => IconButton(
              icon: Icon(productListen.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                productListen.toggleFavoriteStatus();
                productList.notify();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {},
          ),
        ),
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push((MaterialPageRoute(
            //   builder: (BuildContext ctx) => ProductDetailScreen(title: title),
            // )));
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
