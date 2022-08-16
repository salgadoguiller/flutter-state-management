import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/products.cubit.dart';

import '../widgets/products_grid_bloc.widget.dart';
import '../widgets/app_drawer.dart';

enum FilterOptions {
  add,
  removeLast,
  removeFirst,
}

class ProductsOverviewBlocScreen extends StatelessWidget {
  static const routeName = '/products-overview-bloc';

  const ProductsOverviewBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsCubit = BlocProvider.of<ProductsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.add) {
                // context.read<ProductsCubit>().add();
                productsCubit.add();
              } else if (value == FilterOptions.removeLast) {
                context.read<ProductsCubit>().removeLast();
              } else {
                context.read<ProductsCubit>().removeFirst();
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: FilterOptions.add,
                child: Text('Add Item'),
              ),
              const PopupMenuItem(
                value: FilterOptions.removeLast,
                child: Text('Remove Last Item'),
              ),
              const PopupMenuItem(
                value: FilterOptions.removeFirst,
                child: Text('Remove First Item'),
              ),
            ],
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: const ProductGridBloc(),
    );
  }
}
