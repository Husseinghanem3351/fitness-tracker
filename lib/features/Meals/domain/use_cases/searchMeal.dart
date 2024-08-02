import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../entities/meal.dart';
import '../repositories/repositories.dart';

class SearchMealUseCase{
  MealsRepositories repositories;
  SearchMealUseCase({required this.repositories});

  Future<Either<Failure,(List<Meal>,List<Meal>)>> call (String name)async{
    return await repositories.searchMeal(name);

  }
}