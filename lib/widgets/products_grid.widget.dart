import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.provider.dart';

import '../providers/products.provider.dart';

import 'product_item.widget.dart';

class ProductGrid extends StatelessWidget {
  final bool showOnlyFavorites;

  const ProductGrid({
    required this.showOnlyFavorites,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products productList = Provider.of<Products>(context);
    final List<Product> products =
        showOnlyFavorites ? productList.favoriteItems : productList.items;

    if (products.isEmpty) {
      return const Center(
        child: Text('No products found'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      // itemBuilder: (ctx, i) => ChangeNotifierProvider(
      //   create: (ctx) => products[i],
      //   child: const ProductItem(),
      // ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
