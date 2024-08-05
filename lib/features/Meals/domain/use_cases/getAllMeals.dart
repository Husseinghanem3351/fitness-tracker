import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../entities/meal.dart';
import '../repositories/repositories.dart';

class GetAllMealsUseCase {
  MealsRepositories repository;
  GetAllMealsUseCase({required this.repository});

  Future<Either<Failure,(List<Meal>,List<Meal>)>> call()async{
    return await repository.getAllMeals();
  }
}