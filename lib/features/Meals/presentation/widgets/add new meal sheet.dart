import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../global/global_methods.dart';
import '../../../../global/widgets/default_button.dart';
import '../../../../global/widgets/default_text_form_field.dart';
import '../../domain/entities/meal.dart';
import '../bloc/MealsCubit/MealsCubit.dart';

void addNewMealSheet(context) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  TextEditingController proteinController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController carbController = TextEditingController();
  showBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) {
          double height=MediaQuery.of(context).size.height/2;
          return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DefaultFormField(
                      controller: nameController,
                      hintText: S.of(context).mealName,
                      validator: (value) => validatorMethod(value,context),
                    ),
                    DefaultFormField(
                      textInputType: TextInputType.number,
                      controller: caloriesController,
                      hintText: '${S.of(context).calories} ${S.of(context).per100g}',
                      validator: (value) => validatorMethod(value,context),
                    ),
                    DefaultFormField(
                      textInputType: TextInputType.number,
                      controller: proteinController,
                      hintText: '${S.of(context).protein} ${S.of(context).per100g}',
                      validator: (value) => validatorMethod(value,context),
                    ),
                    DefaultFormField(
                      textInputType: TextInputType.number,
                      controller: fatController,
                      hintText: '${S.of(context).fat} ${S.of(context).per100g}',
                      validator: (value) => validatorMethod(value,context),
                    ),
                    DefaultFormField(
                      textInputType: TextInputType.number,
                      controller: carbController,
                      hintText: '${S.of(context).carb} ${S.of(context).per100g}',
                      validator: (value) => validatorMethod(value,context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: DefaultButton(
                            textBtn: S.of(context).cancel,
                            color: Colors.grey.withOpacity(.1),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: DefaultButton(
                            textBtn: S.of(context).confirm,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                MealsCubit.get(context).addMeal(Meal(
                                  protein:
                                  double.parse(proteinController.text),
                                  fat: double.parse(fatController.text),
                                  carb: double.parse(carbController.text),
                                  calories: double.parse(caloriesController.text),
                                  name: nameController.text,
                                ));
                                nameController.clear();
                                caloriesController.clear();
                                fatController.clear();
                                proteinController.clear();
                                carbController.clear();
                                Navigator.of(context).pop(false);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        },
      ));
}
