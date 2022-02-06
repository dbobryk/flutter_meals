import 'package:flutter/material.dart';
import 'package:flutter_meals/models/dummy_data.dart';
import 'package:flutter_meals/widgets/meal_item.dart';

import '../models/meal.dart';

class CategortyMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

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
    displayedMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(
      () {
        displayedMeals.removeWhere((element) => element.id == mealId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(displayedMeals[index], _removeMeal);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
