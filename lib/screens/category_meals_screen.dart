import 'package:flutter/material.dart';
import 'package:flutter_meals/widgets/meal_item.dart';

import '../models/meal.dart';

class CategortyMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> availableMeals;

  CategortyMealsScreen(this.availableMeals);

  @override
  State<CategortyMealsScreen> createState() => _CategortyMealsScreenState();
}

class _CategortyMealsScreenState extends State<CategortyMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(displayedMeals[index]);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
