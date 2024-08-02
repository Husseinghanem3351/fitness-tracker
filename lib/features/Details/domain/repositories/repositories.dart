import 'package:dartz/dartz.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/dailyCalories.dart';
import 'package:flutter/material.dart';
import '../../../../global/errors/failure.dart';
import '../entities/eating.dart';

abstract class DetailsRepositories {
  Future<Either<Failure, List<Eating>>> getEatingCalories();
  Future<Either<Failure, Unit>> deleteEatingCalories(int id);
  Future<Either<Failure, Unit>> addEatingCalories(Eating eatingCalories);
  Future<Either<Failure, List<Eating>>> searchEatingCaloriesIn(
      DateTimeRange domainDate);
  Future<Either<Failure, List<Burning>>> getBurningCalories();
  Future<Either<Failure, Unit>> deleteBurningCalories(int id);
  Future<Either<Failure, Unit>> addBurningCalories(Burning burningCalories);
  Future<Either<Failure, List<Burning>>> searchBurningCalories(
      DateTimeRange domainDate);
  Future<Either<Failure, Unit>> updateCalories();
  Future<Either<Failure, List<DailyCalories>>> getDailyCalories();
}
