import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../domain/entities/dailyCalories.dart';

class StatisticsListItem  extends StatelessWidget {
  const StatisticsListItem ({super.key,required this.dailyCalories});
  final DailyCalories dailyCalories;
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(15),
              boxShadow:  [BoxShadow(offset:const Offset(1, 1),color: Colors.grey.withOpacity(.1))]
          ),
          child: Column(
            children: [
              Text(
                '${dailyCalories.date}'.substring(0, 10),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        S.of(context).eaten,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          Text(
                            '${dailyCalories.eatingCalories?.round()}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 10,),
                          Text(S.of(context).cal,style: Theme.of(context).textTheme.labelMedium,),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        S.of(context).burned,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          Text(
                            '${dailyCalories.burningCalories?.round()}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 10,),
                          Text(S.of(context).cal,style: Theme.of(context).textTheme.labelMedium,),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        S.of(context).goal,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          Text(
                            '${(dailyCalories.goalCalories! + dailyCalories.eatingCalories!).round()}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 10,),
                          Text(S.of(context).cal,style: Theme.of(context).textTheme.labelMedium,),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        S.of(context).protein,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${dailyCalories.protein?.round()} ${S.of(context).g}',
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
                        '${dailyCalories.fat?.round()} ${S.of(context).g}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'carb',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${dailyCalories.carb?.round()} ${S.of(context).g}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
}
