import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './providers/products.provider.dart';
import './blocs/products.cubit.dart';

import 'screens/home.screen.dart';
import 'screens/products_overview_bloc.screen.dart';
import 'screens/products_overview.screen.dart';
import 'screens/favorite_products.screen.dart';
import 'screens/product_detail.screen.dart';
import 'screens/not_found.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        BlocProvider(
          create: (_) => ProductsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.green,
            secondary: Colors.deepOrange,
          ),
        ),
        initialRoute: '/', // default is '/',
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          ProductsOverviewBlocScreen.routeName: (ctx) =>
              const ProductsOverviewBlocScreen(),
          ProductsOverviewScreen.routeName: (ctx) =>
              const ProductsOverviewScreen(),
          FavoriteProductsScreen.routeName: (ctx) =>
              const FavoriteProductsScreen(),
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (ctx) => const NotFoundScreen(),
        ),
      ),
    );
  }
}
