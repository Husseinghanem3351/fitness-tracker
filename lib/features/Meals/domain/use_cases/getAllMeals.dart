import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../entities/meal.dart';
import '../repositories/repositories.dart';

class GetAllMealsUseCase {
  MealsRepositories repositories;
  GetAllMealsUseCase({required this.repositories});

  Future<Either<Failure,(List<Meal>,List<Meal>)>> call()async{
    return await repositories.getAllMeals();
  }
}