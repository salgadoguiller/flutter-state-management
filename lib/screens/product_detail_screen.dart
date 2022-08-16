import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.provider.dart';

import '../providers/products.provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    final Products productList = Provider.of<Products>(context, listen: false);
    final Product product = productList.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: const Center(
        child: Text('Product Detail Screen'),
      ),
    );
  }
}
