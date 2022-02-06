import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/category_meals_screen.dart';
import 'package:flutter_meals/screens/filters_screen.dart';
import 'package:flutter_meals/screens/meal_detail_screen.dart';
import 'package:flutter_meals/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Colors.white,
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline1: const TextStyle(
                fontSize: 22,
                fontFamily: "RobotoCondensed",
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: Colors.grey,
        ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategortyMealsScreen.routeName: (ctx) => CategortyMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategortyMealsScreen(),
        );
      },
    );
  }
}
