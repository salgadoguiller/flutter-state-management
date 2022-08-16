import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/products.cubit.dart';
import '../models/product.model.dart';

class ProductGridBloc extends StatelessWidget {
  const ProductGridBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, List<Product>>(
      builder: (ctx, products) {
        if (products.isEmpty) {
          return const Center(
            child: Text('No products found'),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: products.length,
          itemBuilder: (ctx, i) => Center(
            child: Text(products[i].title),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        );
      },
    );
  }
}
