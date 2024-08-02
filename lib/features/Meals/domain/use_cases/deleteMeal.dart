import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';

class DeleteMealUseCase  {
  MealsRepositories repositories;
  DeleteMealUseCase({required this.repositories});

  Future<Either<Failure,Unit>> call(id) async{
    return await repositories.deleteMeal(id);
  }
}