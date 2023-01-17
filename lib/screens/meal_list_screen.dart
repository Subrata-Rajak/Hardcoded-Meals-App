import 'package:flutter/material.dart';

import '../list_items/meal_item.dart';
import '../arguments/meal_list_screen_args.dart';
import '../data/meals_data.dart';

class MealList extends StatelessWidget {
  static const routeName = '/meal_list_screen';
  const MealList({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MealListArgs;
    final categoryId = args.id;
    final categoryTitle = args.title;

    final selectedMeals = meals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: selectedMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            selectedMeals[index].title,
            selectedMeals[index].id,
            selectedMeals[index].imageUrl,
            selectedMeals[index].duration,
            selectedMeals[index].affordability,
            selectedMeals[index].complexity,
          );
        },
      ),
    );
  }
}
