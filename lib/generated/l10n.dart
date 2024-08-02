// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `remaining`
  String get remaining {
    return Intl.message(
      'remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `fat`
  String get fat {
    return Intl.message(
      'fat',
      name: 'fat',
      desc: '',
      args: [],
    );
  }

  /// `carb`
  String get carb {
    return Intl.message(
      'carb',
      name: 'carb',
      desc: '',
      args: [],
    );
  }

  /// `protein`
  String get protein {
    return Intl.message(
      'protein',
      name: 'protein',
      desc: '',
      args: [],
    );
  }

  /// `cal`
  String get cal {
    return Intl.message(
      'cal',
      name: 'cal',
      desc: '',
      args: [],
    );
  }

  /// `Eaten`
  String get eaten {
    return Intl.message(
      'Eaten',
      name: 'eaten',
      desc: '',
      args: [],
    );
  }

  /// `Burned`
  String get burned {
    return Intl.message(
      'Burned',
      name: 'burned',
      desc: '',
      args: [],
    );
  }

  /// `liter`
  String get liter {
    return Intl.message(
      'liter',
      name: 'liter',
      desc: '',
      args: [],
    );
  }

  /// `Goal`
  String get goal {
    return Intl.message(
      'Goal',
      name: 'goal',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get details {
    return Intl.message(
      'details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `your goal`
  String get yourGoal {
    return Intl.message(
      'your goal',
      name: 'yourGoal',
      desc: '',
      args: [],
    );
  }

  /// `Water Tracker`
  String get waterTracker {
    return Intl.message(
      'Water Tracker',
      name: 'waterTracker',
      desc: '',
      args: [],
    );
  }

  /// `lose weight`
  String get losingWeight {
    return Intl.message(
      'lose weight',
      name: 'losingWeight',
      desc: '',
      args: [],
    );
  }

  /// `gain weight`
  String get gainWeight {
    return Intl.message(
      'gain weight',
      name: 'gainWeight',
      desc: '',
      args: [],
    );
  }

  /// `maintain weight`
  String get maintainWeight {
    return Intl.message(
      'maintain weight',
      name: 'maintainWeight',
      desc: '',
      args: [],
    );
  }

  /// `build muscle`
  String get buildMuscle {
    return Intl.message(
      'build muscle',
      name: 'buildMuscle',
      desc: '',
      args: [],
    );
  }

  /// `your active level`
  String get activeLevel {
    return Intl.message(
      'your active level',
      name: 'activeLevel',
      desc: '',
      args: [],
    );
  }

  /// `People who work desk jobs and engage in very little exercise or chores`
  String get workDeskJob {
    return Intl.message(
      'People who work desk jobs and engage in very little exercise or chores',
      name: 'workDeskJob',
      desc: '',
      args: [],
    );
  }

  /// `People who do chores and go on long walks/engage in exercise at least 1 to 3 days in a week`
  String get longWalksOrEngageInExercise {
    return Intl.message(
      'People who do chores and go on long walks/engage in exercise at least 1 to 3 days in a week',
      name: 'longWalksOrEngageInExercise',
      desc: '',
      args: [],
    );
  }

  /// `People who move a lot during the day and workout (moderate effort) at least 3 to 5 days in a week`
  String get workout3To5InWeek {
    return Intl.message(
      'People who move a lot during the day and workout (moderate effort) at least 3 to 5 days in a week',
      name: 'workout3To5InWeek',
      desc: '',
      args: [],
    );
  }

  /// `People who play sports or engage in vigorous exercise on most days`
  String get sportMostDays {
    return Intl.message(
      'People who play sports or engage in vigorous exercise on most days',
      name: 'sportMostDays',
      desc: '',
      args: [],
    );
  }

  /// `People who do intense workouts 6 to 7 days a week with work that demands physical activity`
  String get workout6To7withPhysicalActivity {
    return Intl.message(
      'People who do intense workouts 6 to 7 days a week with work that demands physical activity',
      name: 'workout6To7withPhysicalActivity',
      desc: '',
      args: [],
    );
  }

  /// `Sedentary`
  String get sedentary {
    return Intl.message(
      'Sedentary',
      name: 'sedentary',
      desc: '',
      args: [],
    );
  }

  /// `lightly Active`
  String get lightlyActive {
    return Intl.message(
      'lightly Active',
      name: 'lightlyActive',
      desc: '',
      args: [],
    );
  }

  /// `Moderately Active`
  String get moderatelyActive {
    return Intl.message(
      'Moderately Active',
      name: 'moderatelyActive',
      desc: '',
      args: [],
    );
  }

  /// `very Active`
  String get veryActive {
    return Intl.message(
      'very Active',
      name: 'veryActive',
      desc: '',
      args: [],
    );
  }

  /// `Extra Active`
  String get extraActive {
    return Intl.message(
      'Extra Active',
      name: 'extraActive',
      desc: '',
      args: [],
    );
  }

  /// `previous`
  String get previous {
    return Intl.message(
      'previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get next {
    return Intl.message(
      'next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `age (years)`
  String get age {
    return Intl.message(
      'age (years)',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `height (cm)`
  String get height {
    return Intl.message(
      'height (cm)',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `weight (kg)`
  String get weight {
    return Intl.message(
      'weight (kg)',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `this field is required`
  String get validationMessage {
    return Intl.message(
      'this field is required',
      name: 'validationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `add new meal`
  String get addNewMeal {
    return Intl.message(
      'add new meal',
      name: 'addNewMeal',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `custom Meal`
  String get customMeal {
    return Intl.message(
      'custom Meal',
      name: 'customMeal',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `quantity (g)`
  String get quantity {
    return Intl.message(
      'quantity (g)',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `calories`
  String get calories {
    return Intl.message(
      'calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `g`
  String get g {
    return Intl.message(
      'g',
      name: 'g',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `per 100 g`
  String get per100g {
    return Intl.message(
      'per 100 g',
      name: 'per100g',
      desc: '',
      args: [],
    );
  }

  /// `meal name`
  String get mealName {
    return Intl.message(
      'meal name',
      name: 'mealName',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `are you sure you want to delete this element`
  String get deleteConfirm {
    return Intl.message(
      'are you sure you want to delete this element',
      name: 'deleteConfirm',
      desc: '',
      args: [],
    );
  }

  /// `last 24 h`
  String get lastDay {
    return Intl.message(
      'last 24 h',
      name: 'lastDay',
      desc: '',
      args: [],
    );
  }

  /// `last week`
  String get lastWeek {
    return Intl.message(
      'last week',
      name: 'lastWeek',
      desc: '',
      args: [],
    );
  }

  /// `statistics`
  String get statistics {
    return Intl.message(
      'statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get min {
    return Intl.message(
      'min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `custom Activity`
  String get customActivity {
    return Intl.message(
      'custom Activity',
      name: 'customActivity',
      desc: '',
      args: [],
    );
  }

  /// `activity`
  String get activity {
    return Intl.message(
      'activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `duration (min)`
  String get duration {
    return Intl.message(
      'duration (min)',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `calories per hour`
  String get caloriesPerHour {
    return Intl.message(
      'calories per hour',
      name: 'caloriesPerHour',
      desc: '',
      args: [],
    );
  }

  /// `activity name`
  String get activityName {
    return Intl.message(
      'activity name',
      name: 'activityName',
      desc: '',
      args: [],
    );
  }

  /// `meals`
  String get meals {
    return Intl.message(
      'meals',
      name: 'meals',
      desc: '',
      args: [],
    );
  }

  /// `activities`
  String get activities {
    return Intl.message(
      'activities',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `dark mode`
  String get darkMode {
    return Intl.message(
      'dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `light mode`
  String get lightMode {
    return Intl.message(
      'light mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }
  String get changeLanguage {
    return Intl.message(
      'arabic',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
