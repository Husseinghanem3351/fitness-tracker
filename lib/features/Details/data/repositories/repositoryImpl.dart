import 'package:fitness_tracker2/features/Details/data/data_sources/LocalDataSource/sqflite%20local%20data%20source.dart';
import 'package:fitness_tracker2/features/Details/data/models/Calories_inModel.dart';
import 'package:fitness_tracker2/features/Details/data/models/burning_model.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/dailyCalories.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/eating.dart';
import 'package:flutter/src/material/date.dart';
import '../../../../global/database.dart';
import '../../../../global/errors/failure.dart';
import '../../domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';

class DetailsRepoImpl implements DetailsRepositories {
  DetailsLocalDataSource detailsLocalDataSource = DetailsLocalDataSourceImpl();

  DetailsRepoImpl({required this.detailsLocalDataSource});

  @override
  Future<Either<Failure, Unit>> addEatingCalories(Eating eating) async {
    try {
      EatingCaloriesModel eatingCaloriesModel = EatingCaloriesModel(
        date: eating.date,
        quantity: eating.quantity,
        calories: eating.calories,
        carb: eating.carb,
        fat: eating.fat,
        mealName: eating.mealName,
        protein: eating.protein,
      );
      detailsLocalDataSource.insertToEating(eatingCaloriesModel);
      return const Right(unit);
    } catch (error) {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteEatingCalories(int id) async {
    try {
      detailsLocalDataSource.deleteEatingCaloriesData(id);
      return const Right(unit);
    } catch (error) {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, List<Eating>>> getEatingCalories() async {
    try {
      List<Eating> calories =
          await detailsLocalDataSource.getEatingCaloriesData(database);
      return Right(calories);
    } catch (error) {
      print(error);
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, List<Eating>>> searchEatingCaloriesIn(
      DateTimeRange domainDate) async {
    try {
      List<Eating> calories =
          await detailsLocalDataSource.searchEatingCaloriesData(domainDate);
      return Right(calories);
    } catch (error) {
      print(error);
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, Unit>> addBurningCalories(Burning burning) async {
    try {
      BurningCaloriesModel burningCaloriesModel = BurningCaloriesModel(
        date: burning.date,
        duration: burning.duration,
        calories: burning.calories,
        activityName: burning.activityName,
      );
      detailsLocalDataSource.insertToBurning(burningCaloriesModel);
      return const Right(unit);
    } catch (error) {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteBurningCalories(int id) async {
    try {
      detailsLocalDataSource.deleteBurningCaloriesData(id);
      return const Right(unit);
    } catch (error) {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, List<Burning>>> getBurningCalories() async {
    try {
      List<Burning> burningCalories =
          await detailsLocalDataSource.getBurningCaloriesData(database);
      return Right(burningCalories);
    } catch (error) {
      print(error);
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, List<Burning>>> searchBurningCalories(
      DateTimeRange domainDate) async {
    try {
      List<Burning> burningCalories =
          await detailsLocalDataSource.searchBurningCaloriesData(domainDate);
      return Right(burningCalories);
    } catch (error) {
      print(error);
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCalories() async {
    try {
     await detailsLocalDataSource.updateCalories();
      return const Right(unit);
    } catch (error) {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, List<DailyCalories>>> getDailyCalories() async{
    try{
     List<DailyCalories> dailyCalories= await detailsLocalDataSource.getDailyCaloriesData();
      return Right(dailyCalories);
    }
        catch(error){
      return Left(DatabaseNotFound());
        }
  }
}
