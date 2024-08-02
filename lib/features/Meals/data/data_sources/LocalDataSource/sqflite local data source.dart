import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../global/database.dart';
import '../../../domain/entities/meal.dart';
import '../../models/meal.dart';

abstract class MealLocalDataSource {
  Future<Unit> insertToMeals({
    required MealModel mealModel
  });

  Future<Unit> updateMealData(Meal meal);

  Future<(List<Meal>,List<Meal>)> getMealsData(Database database);

  Future<(List<Meal>,List<Meal>)> searchMeal(String name);

  Future<Unit> deleteMealsData(int id);
}

class MealLocalDataSourceImpl implements MealLocalDataSource {
  @override
  Future<(List<Meal>,List<Meal>)> getMealsData(Database database) async {
    final mealsData = await database.rawQuery('select * from meals');
    final basicMealsData =await database.rawQuery('select * from basicMeals');
    List<MealModel> meals= mealsData.map<MealModel>((e) => MealModel.fromJson(e)).toList();
    List<MealModel> basicMeals= basicMealsData.map<MealModel>((e) => MealModel.fromJson(e)).toList();
    return (meals,basicMeals);
  }

  @override
  Future<Unit> insertToMeals({
    required MealModel mealModel,
  }) async {
    try {
      await database.transaction(
        (txn) => txn.insert(
          'meals',
          mealModel.toJson(),
        ),
      );
    } catch (error) {
      print(error);
    }
    return Future.value(unit);
  }

  @override
  Future<Unit> updateMealData(Meal meal) async {
    try {
      await database.rawUpdate(
          'update meals set name="${meal.name}",calories="${meal.calories}",where id=${meal.id}');
    } catch (error) {
      print(error);
    }
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteMealsData(int id) async {
    try {
      await database.rawDelete('delete from meals where id=$id');
    } catch (error) {
      print(error);
    }
    return Future.value(unit);
  }

  @override
  Future<(List<Meal>,List<Meal>)> searchMeal(String name) async {
    final mealsData = await database.rawQuery('select * from meals where name like"%$name%"');
    final basicMealsData =await database.rawQuery('select * from basicMeals where name like"%$name%"');
    List<MealModel> meals= mealsData.map<MealModel>((e) => MealModel.fromJson(e)).toList();
    List<MealModel> basicMeals= basicMealsData.map<MealModel>((e) => MealModel.fromJson(e)).toList();
    return (meals,basicMeals);

  }
}
