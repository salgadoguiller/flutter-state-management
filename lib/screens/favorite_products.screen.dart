import 'package:flutter/material.dart';
import '../widgets/products_grid.widget.dart';
import '../widgets/app_drawer.dart';

class FavoriteProductsScreen extends StatelessWidget {
  static const routeName = '/favorite-products';

  const FavoriteProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Products Screen'),
      ),
      drawer: const AppDrawer(),
      body: const ProductGrid(showOnlyFavorites: true),
    );
  }
}
