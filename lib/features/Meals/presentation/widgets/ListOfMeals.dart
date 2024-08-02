import 'package:fitness_tracker2/features/Meals/presentation/widgets/MealElement.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/meal.dart';
import 'add meal to eating sheet.dart';

class ListOfMeals extends StatelessWidget {
  final List<Meal> meals;
  final List<Meal> basicMeals;

  const ListOfMeals({
    super.key,
    required this.meals,
    required this.basicMeals,
  });

  @override
  Widget build(BuildContext context) {
    List<Meal> allMeals = [...basicMeals, ...meals];
    return ListView.separated(
      padding: const EdgeInsets.only(top: 15),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          addMealToEatingSheet(
            context,
            meal: allMeals[index],
          );
        },
        child: MealElement(
          isAllowDelete: index > basicMeals.length - 1,
          meal: allMeals[index],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: allMeals.length,
    );
  }
}
