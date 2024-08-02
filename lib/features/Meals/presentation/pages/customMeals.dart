import 'package:fitness_tracker2/features/Meals/presentation/bloc/MealsCubit/MealsCubit.dart';
import 'package:fitness_tracker2/features/Meals/presentation/bloc/MealsCubit/MealsStates.dart';
import 'package:fitness_tracker2/features/Meals/presentation/pages/SaveCustomMeal.dart';
import 'package:fitness_tracker2/features/Meals/presentation/widgets/MealElement.dart';
import 'package:fitness_tracker2/features/Meals/presentation/widgets/add%20new%20meal%20sheet.dart';
import 'package:fitness_tracker2/global/globalMethods.dart';
import 'package:fitness_tracker2/global/widgets/Toast.dart';
import 'package:fitness_tracker2/global/widgets/defaultButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../widgets/CheckBoxTile.dart';
import '../../domain/entities/meal.dart';

class CustomMeal extends StatelessWidget {
  const CustomMeal({super.key});

  @override
  Widget build(BuildContext context) {
    List<Meal> customMealComponent = [];

    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  navigateTo(
                    context,
                    SaveCustomMeal(
                      meals: customMealComponent,
                    ),
                  );
                },
                child: Text(
                  S.of(context).save,
                ))
          ],
        ),
        body: BlocConsumer<MealsCubit, MealsStates>(
          builder: (context, state) {
            List<CheckBoxElement> elements = [
              ...MealsCubit.get(context).meals,
              ...MealsCubit.get(context).basicMeals
            ].map<CheckBoxElement>(
              (meal) {
                return CheckBoxElement(
                  checkBoxWidget: MealElement(
                    isAllowDelete: false,
                    meal: meal,
                  ),
                  function: (value) {
                    if (value) {
                      customMealComponent.add(meal);
                    } else {
                      customMealComponent.remove(meal);
                    }
                  },
                );
              },
            ).toList();
            print(elements.length);
            customMealComponent = [];
            if (state is GetMealsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => elements[index],
                      separatorBuilder: (context, index) => Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      itemCount: MealsCubit.get(context).meals.length +
                          MealsCubit.get(context).basicMeals.length,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    width: double.infinity,
                    child: DefaultButton(
                      onPressed: () {
                        addNewMealSheet(context);
                      },
                      textBtn: 'add new meal',
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is GetMealsErrorState) {
              showToast(context: context, msg: state.error, color: Colors.red);
            } else if (state is GetMealsSuccessState) {
              MealsCubit.get(context).meals = state.meals.$1;
              MealsCubit.get(context).basicMeals = state.meals.$2;
            } else if (state is AddMealsSuccessState) {
              showToast(
                  context: context, msg: state.message, color: Colors.green);
            } else if (state is AddMealsErrorState) {
              showToast(context: context, msg: state.error, color: Colors.red);
            }
          },
        ),
      ),
    );
  }
}
