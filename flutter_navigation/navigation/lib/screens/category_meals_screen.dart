import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  static const routeName = "category-meals";
  final List<Meal> availableMeals;

  const CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final title = routeArgs['categoryTitle'];
    final id = routeArgs['categoryId'];

    final meals = availableMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(title ?? "Unknown name")),
        body: ListView.builder(
            itemBuilder: (ctx, i) {
              return MealItem(
                  id: meals[i].id,
                  affordability: meals[i].affordability,
                  complexity: meals[i].complexity,
                  duration: meals[i].duration,
                  imageUrl: meals[i].imageUrl,
                  title: meals[i].title);
            },
            itemCount: meals.length));
  }
}
