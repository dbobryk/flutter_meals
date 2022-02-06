import 'package:flutter/material.dart';
import 'package:flutter_meals/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: const Center(
        child: Text("Filters"),
      ),
    );
  }
}
