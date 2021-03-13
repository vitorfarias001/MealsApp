import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/utils/app_routes.dart';

/// Item de categoria, utilizado na home do app
class CategoryItem extends StatelessWidget {
  /// Categoria recebida por parâmetro
  final Category category;
  /// Construtor
  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => _selectCategory(context, category),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
      ),
    );
  }

  _selectCategory(BuildContext context, Category category) {
    Navigator.of(context)
        .pushNamed(AppRoutes.CATEGORIES_MEALS, arguments: category);
  }
}
