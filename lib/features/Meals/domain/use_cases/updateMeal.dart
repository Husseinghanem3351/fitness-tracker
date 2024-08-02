import 'package:dartz/dartz.dart';

import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';
class UpdateMealUseCase{
  MealsRepositories repositories;
  UpdateMealUseCase({required this.repositories});
  Future<Either<Failure,Unit>> call(meal) async{
    return await repositories.updateMeal(meal);
  }
}