import 'package:flutter/material.dart';
import 'package:meals_app/arguments/meal_details_screen_args.dart';
import 'package:meals_app/data/meals_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal_details_screen';
  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MealDetailsArgs;
    final mealId = args.id;
    final selectedMeal = meals.firstWhere(
      (meal) => meal.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    height: 200,
                    width: 300,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: selectedMeal.ingredients.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.amberAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(selectedMeal.ingredients[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Steps",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    height: 200,
                    width: 300,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: selectedMeal.steps.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                "# ${(index + 1)}",
                              ),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
