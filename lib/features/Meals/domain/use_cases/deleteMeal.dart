import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';

class DeleteMealUseCase  {
  MealsRepositories repository;
  DeleteMealUseCase({required this.repository});

  Future<Either<Failure,Unit>> call(id) async{
    return await repository.deleteMeal(id);
  }
}