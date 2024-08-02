import 'package:fitness_tracker2/features/Meals/data/models/meal.dart';
import '../../../../global/database.dart';
import '../../../../global/errors/exception.dart';
import '../../../../global/errors/failure.dart';
import '../../domain/entities/meal.dart';
import '../../domain/repositories/repositories.dart';
import '../data_sources/LocalDataSource/sqflite local data source.dart';
import 'package:dartz/dartz.dart';

class MealsRepoImpl implements MealsRepositories {
  final MealLocalDataSource mealLocalDataSource;

  MealsRepoImpl({required this.mealLocalDataSource});

  @override
  Future<Either<Failure, Unit>> addMeal(Meal meal) async {
    MealModel mealModel = MealModel(name: meal.name,
        calories: meal.calories,
        protein: meal.protein,
        carb: meal.carb,
        fat: meal.fat);
    try {
      await mealLocalDataSource.insertToMeals(
          mealModel:mealModel,
      );
      return const Right(unit);
    } on ServerException {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMeal(int id) async {
    try {
      await mealLocalDataSource.deleteMealsData(id);
      return const Right(unit);
    } on ServerException {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, (List<Meal>,List<Meal>)>> getAllMeals() async {
    try {
      (List<Meal>,List<Meal>) meals = await mealLocalDataSource.getMealsData(database);
      return Right(meals);
    } on ServerException {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, (List<Meal>,List<Meal>)>> searchMeal(String name) async {
    try {
      (List<Meal>,List<Meal>) searchResult = await mealLocalDataSource.searchMeal(name);
      return Right(searchResult);
    } on ServerException {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateMeal(Meal meal) async {
    try {
      await mealLocalDataSource.updateMealData(meal);
      return const Right(unit);
    } on ServerException {
      return Left(DatabaseNotFound());
    }
  }
}
