import 'dart:ui';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/widgets/default_button.dart';
import '../../../../global/widgets/delete_dialog.dart';
import '../../../Home/presentation/cubit/cubit.dart';
import '../../domain/entities/meal.dart';
import '../bloc/MealsCubit/MealsCubit.dart';

class MealElement extends StatelessWidget {
  const MealElement(
      {super.key, required this.meal, required this.isAllowDelete,});

  final Meal meal;
  final bool isAllowDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow:  [BoxShadow(offset:const Offset(1, 1),color: Colors.grey.withOpacity(.1))]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    meal.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(width: 10,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${meal.calories.ceilToDouble().toString()} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 10,),
                    Text(S.of(context).cal,style: Theme.of(context).textTheme.labelMedium,),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              elementQuantity(
                context: context,
                elementName: S.of(context).fat,
                quantity: meal.fat.ceilToDouble(),
              ),
              elementQuantity(
                context: context,
                elementName: S.of(context).protein,
                quantity: meal.protein.ceilToDouble(),
              ),
              elementQuantity(
                context: context,
                elementName: S.of(context).carb,
                quantity: meal.carb.ceilToDouble(),
              ),
            ],
          ),
          if (isAllowDelete)
            DefaultButton(
              paddingContent: 0,
              onPressed: () {
                deleteDialog(
                  context: context,
                  message: S.of(context).deleteConfirm,
                  onPressed: () {
                    MealsCubit.get(context).deleteMeal(meal.id!);
                    Navigator.of(context).pop(false);
                  },
                );
              },
              btn: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.secondary,
              opacity: .3,
            ),
        ],
      ),
    );
  }

  Widget elementQuantity({
    required String elementName,
    required double quantity,
    required BuildContext context,
  }) =>
      Column(
        children: [
          Text(
            elementName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Center(
            child: Text(
              ' $quantity ${S.of(context).g}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      );
}
