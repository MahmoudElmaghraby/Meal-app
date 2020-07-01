import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScrenn extends StatelessWidget {
  final List<Meal> favoritMeals;
  FavoritesScrenn(this.favoritMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet -- try to add some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritMeals[index].id,
            title: favoritMeals[index].title,
            imageUrl: favoritMeals[index].imageUrl,
            duration: favoritMeals[index].duration,
            affordability: favoritMeals[index].affordability,
            complexity: favoritMeals[index].complexity,
          );
        },
        itemCount: favoritMeals.length,
      );
    }
  }
}
