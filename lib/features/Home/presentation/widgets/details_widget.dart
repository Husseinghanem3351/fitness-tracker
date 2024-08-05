import 'package:fitness_tracker2/features/Home/presentation/widgets/show_element_quantity.dart';
import 'package:fitness_tracker2/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../global/global.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: height * .45,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              color: Colors.grey.withOpacity(
                .1,
              ),
            ),
          ],
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).remaining),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${eatRemainingCalories.round()}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).cal,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).burned,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Text('${burningCalories.round()}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).cal,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(S.of(context).eaten,
                      style: Theme.of(context).textTheme.bodySmall),
                  Row(
                    children: [
                      Text('${eatingCalories.round()}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).cal,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElementQuantity(
                  quantity: eatingFat,
                  name: S.of(context).fat,
                  goal: requiredFat,
                ),
                ElementQuantity(
                  quantity: eatingProtein,
                  name: S.of(context).protein,
                  goal: requiredProtein,
                ),
                ElementQuantity(
                  quantity: eatingCarb,
                  name: S.of(context).carb,
                  goal: requiredCarb,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
