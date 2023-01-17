import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

import './screens/categories_screen.dart';
import 'screens/meal_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoriesScreen(),
        MealList.routeName: (context) => const MealList(),
        MealDetails.routeName: (context) => const MealDetails(),
      },
    );
  }
}
