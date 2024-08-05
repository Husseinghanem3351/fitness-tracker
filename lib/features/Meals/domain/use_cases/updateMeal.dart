import 'package:dartz/dartz.dart';

import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';
class UpdateMealUseCase{
  MealsRepositories repository;
  UpdateMealUseCase({required this.repository});
  Future<Either<Failure,Unit>> call(meal) async{
    return await repository.updateMeal(meal);
  }
}