import 'package:fitness_tracker2/features/Details/domain/entities/eating.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/cubit.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/states.dart';
import 'package:fitness_tracker2/global/widgets/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/global_methods.dart';
import '../../../../global/widgets/default_button.dart';
import '../../../../global/widgets/default_text_form_field.dart';
import '../../domain/entities/meal.dart';

void addMealToEatingSheet(context, {required Meal meal}) {
  TextEditingController quantityController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  showBottomSheet(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(S.of(context).name),
                const Spacer(),
                Text(meal.name),
              ],
            ),
            Row(
              children: [
                Text(S.of(context).calories),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      meal.calories.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      S.of(context).cal,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            if (meal.defaultValueName != null)
              Text(
                  '${meal.defaultValueName} = ${meal.defaultValue} ${S.of(context).g}'),
            Form(
              key: formKey,
              child: DefaultFormField(
                controller: quantityController,
                hintText: S.of(context).quantity,
                textInputType: TextInputType.number,
                validator: (value) => validatorMethod(value, context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  DefaultButton(
                    textBtn: S.of(context).cancel,
                    color: Colors.grey.withOpacity(.1),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  const Spacer(),
                  BlocConsumer<DetailsCubit, DetailsStates>(
                    builder: (context, state) {
                      return DefaultButton(
                        textBtn: S.of(context).add,
                        color: Colors.white,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            double quantity =
                                double.parse(quantityController.text);
                            DetailsCubit.get(context).addToEatingCalories(
                              Eating(
                                date: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                ),
                                quantity: quantity,
                                calories: meal.calories * quantity / 100,
                                protein: meal.protein * quantity / 100,
                                carb: meal.carb * quantity / 100,
                                mealName: meal.name,
                                fat: meal.fat * quantity / 100,
                              ),
                            );
                          }
                        },
                      );
                    },
                    listener: (BuildContext context, DetailsStates state) {
                      if (state is SuccessAddDetailsState) {
                        showToast(
                          context: context,
                          msg: state.message,
                          color: Colors.green,
                        );
                      } else if (state is SuccessGetDetailsState) {
                        DetailsCubit.get(context).details = state.detailsList;
                        DetailsCubit.get(context).showDetails = state.detailsList;
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
