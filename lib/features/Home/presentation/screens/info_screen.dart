import 'dart:convert';
import 'package:fitness_tracker2/features/Home/presentation/screens/goals_screen.dart';
import 'package:fitness_tracker2/features/Home/presentation/screens/personal_info.dart';
import 'package:fitness_tracker2/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../global/global.dart';
import '../../../../global/global_methods.dart';
import '../../data/cache helper.dart';
import '../../data/model.dart';
import '../cubit/cubit.dart';
import 'home.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final TextEditingController weightController = TextEditingController(text: personalInfo?.weight.toString());
  final TextEditingController nameController = TextEditingController(text: personalInfo?.name);
  final TextEditingController ageController = TextEditingController(text: personalInfo?.age.toString());
  final TextEditingController heightController = TextEditingController(text: personalInfo?.height.toString());
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      PersonalInfo(
        weightController: weightController,
        nameController: nameController,
        ageController: ageController,
        heightController: heightController,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(child: GoalsScreen()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                  borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    index--;
                  });
                },
                child: Text(
                  S.of(context).previous,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ),
        ],
      ),
    ]; // this list to show two screens together in the info screen,
    // the first for personal info,
    // and the second one for goals and activity level
    // we can switch between them in previous and next button
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Text(index == 0 ? S.of(context).next : S.of(context).save),
        onPressed: () {
          if (index == 0) {
            if (formKey.currentState!.validate()) {
              setState(() {
                index = 1;
              });
            }
          } else {
            CacheHelper.putData(
              key: 'personalInfo',
              value: jsonEncode(
                PersonalInfoModel(
                  gender: HomeCubit.get(context).gender,
                  age: double.parse(ageController.text),
                  height: double.parse(heightController.text),
                  weight: double.parse(weightController.text),
                  name: nameController.text,
                ).toJson(),

              ),
            );
            CacheHelper.putData(
                key: 'goal', value: HomeCubit.get(context).goal);
            CacheHelper.putData(
              key: 'activityLevel',
              value: HomeCubit.get(context).activeLevel,
            );
            HomeCubit.get(context).calculateMain();
            navigateAndFinish(context,const Home());
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: screens[index],
        ),
      ),
    );
  }
}
