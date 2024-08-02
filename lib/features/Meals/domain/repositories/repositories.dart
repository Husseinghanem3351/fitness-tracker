
import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../entities/meal.dart';

abstract class MealsRepositories{
  Future<Either<Failure,(List<Meal>,List<Meal>)>> getAllMeals();
  Future<Either<Failure,Unit>> deleteMeal(int id);
  Future<Either<Failure,Unit>> updateMeal(Meal meal);
  Future<Either<Failure,Unit>> addMeal(Meal meal);
  Future<Either<Failure,(List<Meal>,List<Meal>)>> searchMeal(String name);
}