import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/products.cubit.dart';
import '../models/product.model.dart';

import '../screens/products_overview.screen.dart';
import '../screens/favorite_products.screen.dart';
import '../screens/products_overview_bloc.screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, List<Product>>(
      builder: (context, products) {
        return Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Sidebar (${products.length} products)'),
              ),
              // const Divider(),
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
              const Divider(),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Products using bloc'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                      ProductsOverviewBlocScreen.routeName);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
