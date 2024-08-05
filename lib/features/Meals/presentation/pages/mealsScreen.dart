import 'package:fitness_tracker2/features/Meals/presentation/pages/customMeals.dart';
import 'package:fitness_tracker2/global/global_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/widgets/show_toast.dart';
import '../../../../global/widgets/default_button.dart';
import '../../../../global/widgets/default_text_form_field.dart';
import '../../domain/entities/meal.dart';
import '../bloc/MealsCubit/MealsCubit.dart';
import '../bloc/MealsCubit/MealsStates.dart';
import '../widgets/ListOfMeals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Future.delayed(const Duration(milliseconds: 200))
                  .then((value) => Navigator.pop(context));
            },
          ),
        ),
        body: BlocConsumer<MealsCubit, MealsStates>(
          builder: (context, state) {
            if (state is GetMealsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  DefaultFormField(
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      MealsCubit.get(context).searchMeal(searchController.text);
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        MealsCubit.get(context)
                            .searchMeal(searchController.text);
                      }
                    },
                    hintText: S.of(context).search,
                  ),
                  Expanded(child: buildBody(context)),
                  Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: DefaultButton(
                      textBtn: S.of(context).customMeal,
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        navigateTo(
                          context,
                          const CustomMeal(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is GetMealsErrorState) {
              showToast(context: context, msg: state.error, color: Colors.red);
            } else if (state is EditMealsErrorState) {
              showToast(context: context, msg: state.error, color: Colors.red);
            } else if (state is EditMealsSuccessState) {
              showToast(
                  context: context, msg: state.message, color: Colors.red);
            } else if (state is GetMealsSuccessState) {
              MealsCubit.get(context).meals = state.meals.$1;
              MealsCubit.get(context).basicMeals = state.meals.$2;
            } else if (state is DeleteMealsSuccessState) {
              showToast(
                  context: context, msg: state.message, color: Colors.green);
            } else if (state is DeleteMealsErrorState) {
              showToast(context: context, msg: state.error, color: Colors.red);
            }
          },
        ),
      ),
    );
  }

  Widget buildBody(context) {
    List<Meal> meals = MealsCubit.get(context).meals;
    List<Meal> basicMeals = MealsCubit.get(context).basicMeals;
    if (meals.isNotEmpty || basicMeals.isNotEmpty) {
      return ListOfMeals(
        meals: meals,
        basicMeals: basicMeals,
      );
    } else if (meals.isEmpty) {
      return const Center(
          child: Text(
        'database empty',
      ));
    }
    return const Center(child: CircularProgressIndicator());
  }
}
