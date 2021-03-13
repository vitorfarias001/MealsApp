import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  /// Lista de receitas favoritas recebidas da main
  final List<Meal> favoriteMeals;

  /// Construtor
  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma receita favorita ainda...'),
      );
    }

    return Container(
      child: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, item) {
          return MealItem(favoriteMeals[item]);
        },
      ),
    );
  }
}
