import 'package:flutter/material.dart';
import 'package:navigation/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  static const routeName = "category-meals";

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final title = routeArgs['categoryTitle'];
    final id = routeArgs['categoryId'];
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(title ?? "Unknown name")),
        body: ListView.builder(
            itemBuilder: (ctx, i) {
              return Text(meals[i].title);
            },
            itemCount: meals.length));
  }
}
