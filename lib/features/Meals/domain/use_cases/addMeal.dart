import '../../../../global/errors/failure.dart';
import '../entities/meal.dart';
import '../repositories/repositories.dart';
import 'package:dartz/dartz.dart';

class AddMealUseCase{

  MealsRepositories repository;
  AddMealUseCase({
    required this.repository,
});

  Future<Either<Failure,Unit>> call(Meal meal) async{
    return await repository.addMeal(meal);
  }
}