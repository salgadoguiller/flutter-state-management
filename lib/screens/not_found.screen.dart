import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('404'),
      ),
    );
  }
}
