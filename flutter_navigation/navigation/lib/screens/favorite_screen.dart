import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';

import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favMeals;

  const FavoriteScreen({Key? key, required this.favMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return const Center(
          child: Text('You have no favorites yet - start adding some!'));
    } else {
      return ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
                id: favMeals[i].id,
                affordability: favMeals[i].affordability,
                complexity: favMeals[i].complexity,
                duration: favMeals[i].duration,
                imageUrl: favMeals[i].imageUrl,
                title: favMeals[i].title);
          },
          itemCount: favMeals.length);
    }
  }
}
