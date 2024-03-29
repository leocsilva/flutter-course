import 'package:delimeals/models/meal.dart';
import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String _categoryTitle = routeArgs['title'];
    final String _categoryId = routeArgs['id'];

    final categoryMeals = availableMeals
        .where((item) => item.categories.contains(_categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
            );
          },
          itemCount: categoryMeals.length,),
    );
  }
}
