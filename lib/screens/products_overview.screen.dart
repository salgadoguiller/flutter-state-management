import 'package:flutter/material.dart';
import '../widgets/products_grid.widget.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/products-overview';

  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  changeFilter(FilterOptions value) {
    setState(() {
      if (value == FilterOptions.favorites) {
        _showOnlyFavorites = true;
      } else {
        _showOnlyFavorites = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_showOnlyFavorites ? 'Favorites' : 'All Products'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: changeFilter,
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show All'),
              ),
            ],
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductGrid(showOnlyFavorites: _showOnlyFavorites),
    );
  }
}
