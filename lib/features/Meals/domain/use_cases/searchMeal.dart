import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../entities/meal.dart';
import '../repositories/repositories.dart';

class SearchMealUseCase{
  MealsRepositories repository;
  SearchMealUseCase({required this.repository});

  Future<Either<Failure,(List<Meal>,List<Meal>)>> call (String name)async{
    return await repository.searchMeal(name);

  }
}