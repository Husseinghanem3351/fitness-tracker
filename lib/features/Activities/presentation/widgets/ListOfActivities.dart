import 'package:fitness_tracker2/features/Activities/presentation/widgets/ActivityElement.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/activity.dart';
import 'add acticity to burning sheet.dart';

class ListOfActivities extends StatelessWidget {
  final List<Activity> activities;

  const ListOfActivities({
    super.key,
    required this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.only(top: 15),
        itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                addActivityToBurningSheet(
                  context,
                  activity: activities[index],
                );
              },
              child: ActivityElement(
                activity: activities[index],
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: activities.length);
  }
}
