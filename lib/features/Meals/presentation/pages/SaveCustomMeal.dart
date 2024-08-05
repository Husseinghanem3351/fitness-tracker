import 'package:fitness_tracker2/global/widgets/default_button.dart';
import 'package:fitness_tracker2/global/widgets/default_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/global_methods.dart';
import '../../domain/entities/meal.dart';
import '../bloc/MealsCubit/MealsCubit.dart';

class SaveCustomMeal extends StatelessWidget {
  const SaveCustomMeal({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState>? formKey=GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    List<TextEditingController> controllers = List.generate(
      meals.length,
      (index) => TextEditingController(text: '100'),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              DefaultFormField(
                controller: nameController,
                hintText: S.of(context).description,
                validator: (value){
                  return validatorMethod(value,context);
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text(meals[index].name),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: DefaultFormField(
                            controller: controllers[index],
                            textInputType: TextInputType.number,
                            labelText: S.of(context).quantity,
                            validator: (value){
                             return validatorMethod(value,context);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: meals.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: DefaultButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      Meal meal = calculateMeal(
                        meals: meals,
                        controllers: controllers,
                        nameController: nameController,
                      );
                      MealsCubit.get(context).addMeal(meal);
                      Navigator.pop(context);
                    }
                  },
                  textBtn: S.of(context).save,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Meal calculateMeal({
    required List<TextEditingController> controllers,
    required List<Meal> meals,
    required TextEditingController nameController,
  }) {
    double carb = 0;
    double protein = 0;
    double fat = 0;
    double calories = 0;
    double quantity = 0;
    for (int i = 0; i < meals.length; i++) {
      carb += meals[i].carb;
      calories += meals[i].calories;
      fat += meals[i].fat;
      protein += meals[i].protein;
      quantity += int.parse(controllers[i].text);
    }
    carb = (carb * 100) / quantity;
    protein = (protein * 100) / quantity;
    fat = (fat * 100) / quantity;
    calories = (calories * 100) / quantity;
    return Meal(
      carb: carb,
      fat: fat,
      protein: protein,
      name: nameController.text,
      calories: calories,
    );
  }

  // String? validatorMethod(String? value,BuildContext context){
  //   if (value!.isEmpty) {
  //     return S.of(context).validationMessage;
  //   }
  //   return null;
  // }
}
