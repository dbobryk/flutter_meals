import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/filters_screen.dart';
import 'package:flutter_meals/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildNavigationListTile(
      IconData icon, String text, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            "Cooking",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildNavigationListTile(Icons.restaurant, "Meals", () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildNavigationListTile(Icons.settings, "Filters", () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
