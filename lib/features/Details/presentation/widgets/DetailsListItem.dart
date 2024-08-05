import 'package:fitness_tracker2/features/Details/data/models/Calories_inModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../generated/l10n.dart';
import '../../../Home/presentation/cubit/cubit.dart';

bool expand = false;

class DetailsItem extends StatefulWidget {
  const DetailsItem({
    super.key,
    required this.detailItems,
  });

  final dynamic detailItems;

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow:  [BoxShadow(offset:const Offset(1, 1),color: Colors.grey.withOpacity(.1))]
      ),
      child: widget.detailItems.runtimeType == EatingCaloriesModel
          ? mealItem()
          : activityItem(),
    );
  }

  Widget activityItem() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  '${widget.detailItems.activityName}',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
                Text(
                  '${widget.detailItems.date}'.substring(0, 10),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${widget.detailItems.duration.round()}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      S.of(context).min,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${widget.detailItems.calories.round()}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      S.of(context).cal,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  Widget mealItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.detailItems.mealName}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '${widget.detailItems.date}'.substring(0, 10),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.detailItems.quantity.round()} ${S.of(context).g}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  Text(
                    '${widget.detailItems.calories.round()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    S.of(context).cal,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    S.of(context).carb,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${widget.detailItems.carb.round()} ${S.of(context).g}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    S.of(context).protein,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${widget.detailItems.protein.round()} ${S.of(context).g}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    S.of(context).fat,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${widget.detailItems.fat.round()} ${S.of(context).g}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
