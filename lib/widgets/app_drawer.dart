import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../screens/favorite_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Sidebar'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.circle),
            title: const Text('All products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FavoriteProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
