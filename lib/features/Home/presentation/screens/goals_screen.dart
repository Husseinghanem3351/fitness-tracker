import 'package:fitness_tracker2/features/Home/presentation/cubit/cubit.dart';
import 'package:fitness_tracker2/features/Home/presentation/widgets/radio_button_list.dart';
import 'package:fitness_tracker2/generated/l10n.dart';
import 'package:fitness_tracker2/global/global.dart';
import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(S.of(context).yourGoal),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: RadioButtonList(
              selectedOption: goalIndex,
              items: [
                S.of(context).losingWeight,
                S.of(context).maintainWeight,
                S.of(context).gainWeight,
                S.of(context).buildMuscle,
              ],
              onChanged: (value) {
                HomeCubit.get(context).goal = value!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(S.of(context).activeLevel),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: RadioButtonList(
              selectedOption: levelIndex,
              subItems: [
                S.of(context).workDeskJob,
                S.of(context).longWalksOrEngageInExercise,
                S.of(context).workout3To5InWeek,
                S.of(context).sportMostDays,
                S.of(context).workout6To7withPhysicalActivity,
              ],
              items: [
                S.of(context).sedentary,
                S.of(context).lightlyActive,
                S.of(context).moderatelyActive,
                S.of(context).veryActive,
                S.of(context).extraActive,
              ],
              onChanged: (value) {
                HomeCubit.get(context).activeLevel = value!;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
