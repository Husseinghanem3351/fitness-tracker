import 'dart:async';
import 'dart:convert';
import 'package:fitness_tracker2/features/Home/data/cache%20helper.dart';
import 'package:fitness_tracker2/features/Home/data/model.dart';
import 'package:fitness_tracker2/features/Home/presentation/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../global/global.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool showAddButton = false;

  changeAddButtonState() {
    showAddButton = !showAddButton;
    emit(ChangeAddButtonState());
  }

  double liters = 0;

  addGlass({double? litersChange}) {
    if (litersChange != null) {
      liters = litersChange;
    } else {
      liters += .25;
    }
    // CacheHelper.putData(key: 'water', value: liters);
    emit(ChangeAddButtonState());
  }

  String goal = '';
  String activeLevel = '';
  String gender = 'Female';

  //7,700 cal is one kg
  // 30 day 3 kg so=> 3*7700=23100 cal per month
  //so 23100/30=770 cal per day so that's good we can adjust between 500 to 1000
  Future<void> calculateBmr() async {
    emit(CalculateBmrLoading());
    var data = await CacheHelper.getData(key: 'personalInfo');
    if (data != null) {
      personalInfo = PersonalInfoModel.fromJson(jsonDecode(data));
      gender = personalInfo!.gender;
      activeLevel = await CacheHelper.getData(key: 'activityLevel');
      goal = await CacheHelper.getData(key: 'goal');
      if (gender == 'Male') {
        print('male');
        eatRemainingCalories = 66.47 +
            (13.75 * personalInfo!.weight) +
            (5.003 * personalInfo!.height) -
            (6.755 * personalInfo!.age);
      } else {
        print('female');
        eatRemainingCalories = 655.1 +
            (9.563 * personalInfo!.weight) +
            (1.850 * personalInfo!.height) -
            (4.676 * personalInfo!.age);
      }
      switch (activeLevel) {
        case 'Sedentary' || 'كسول':
          {
            eatRemainingCalories *= 1.2;
            waterRequired = 30*personalInfo!.weight/100;
            levelIndex = 0; // to determine the saved activity level.
          }
        case 'lightly Active' || 'خفيف النشاط':
          {
            eatRemainingCalories *= 1.375;
            waterRequired = 30*personalInfo!.weight/1000;
            levelIndex = 1;
          }
        case 'Moderately Active' || 'متوسط النشاط':
          {
            eatRemainingCalories *= 1.55;
            waterRequired = 30*personalInfo!.weight/1000;
            levelIndex = 2;
          }
        case 'very Active' || 'نشط جدا':
          {
            eatRemainingCalories *= 1.725;

            waterRequired = 49*personalInfo!.weight/1000;
            levelIndex = 3;
          }
        case 'Extra Active' || 'نشط للغاية':
          {
            eatRemainingCalories *= 1.9;
            waterRequired = 49*personalInfo!.weight/1000;
            levelIndex = 4;
          }
      }
      switch (goal) {
        case 'lose weight' || 'خسارة وزن':
          {
            eatRemainingCalories -= 700;
            requiredProtein=(.3*eatRemainingCalories)/4;
            requiredFat=(.25*eatRemainingCalories)/9;
            requiredCarb=(.45*eatRemainingCalories)/4;
            goalIndex = 0;
          }
        case 'gain weight' || 'زيادة وزن':
          {
            eatRemainingCalories += 700;
            requiredProtein=(.25*eatRemainingCalories)/4;
            requiredFat=(.25*eatRemainingCalories)/9;
            requiredCarb=(.5*eatRemainingCalories)/4;
            goalIndex = 2;
          }
        case 'build muscle' || 'بناء عضلات':
          {
            eatRemainingCalories += 700;
            requiredProtein=(.25*eatRemainingCalories)/4;
            requiredFat=(.25*eatRemainingCalories)/9;
            requiredCarb=(.5*eatRemainingCalories)/4;
            goalIndex = 3; // to determine the goal in screen
          }
        default:
          {
            requiredProtein=(.2*eatRemainingCalories)/4;
            requiredFat=(.3*eatRemainingCalories)/9;
            requiredCarb=(.5*eatRemainingCalories)/4;
            goalIndex = 1;
          }
      }
    }
  }

  void calculateMain() async {
    // to call function that calculate calories
    await calculateBmr();
    emit(ChangeInfoState());
  }


  bool isDark = true;
  IconData darkModeIcon = Icons.track_changes;

  void changeDarkMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    }
    else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeDarkModeState());
      });
    }
    darkModeIcon = isDark ? Icons.light_mode : Icons.dark_mode;
  }


  void changeLanguage() {
    if (language == 'en') {
      language = 'ar';
    } else {
      language = 'en';
    }
    emit(ChangeLanguageState());
  }
}
//men BMR = 66.47 + ( 13.75 x weight in kg ) + ( 5.003 x height in cm ) - ( 6.755 x age in years)
//women BMR = 655.1 + ( 9.563 x weight in kg ) + ( 1.850 x height in cm ) - ( 4.676 x age in years)
