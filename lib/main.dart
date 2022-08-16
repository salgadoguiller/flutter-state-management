import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.provider.dart';
import './screens/home_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/favorite_products_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return ChangeNotifierProvider(
      create: (_) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.green,
            secondary: Colors.deepOrange,
          ),
        ),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          ProductsOverviewScreen.routeName: (ctx) =>
              const ProductsOverviewScreen(),
          FavoriteProductsScreen.routeName: (ctx) =>
              const FavoriteProductsScreen(),
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
      ),
    );
  }
}
