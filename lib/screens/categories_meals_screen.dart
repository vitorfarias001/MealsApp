import 'package:flutter/material.dart';
import 'package:meals_app/components/meal_item.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

/// Tela para apresentar as refeições marcadas como favorita
class CategoriesMealsScreen extends StatelessWidget {
  /// Lista de refeições favoritas
  final List<Meal> meals;
  /// Construtor
  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final Category category =
    ModalRoute.of(context).settings.arguments as Category;

    List<Meal> categoryMeals = meals
        .where((Meal meal) => meal.categories.contains(category.id))
        .toList();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
