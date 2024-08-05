
import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../entities/eating.dart';
import '../repositories/repositories.dart';

class GetEatingCaloriesUseCase {
  DetailsRepositories repository;
  GetEatingCaloriesUseCase({required this.repository});

  Future<Either<Failure,List<Eating>>> call()async{
    return await repository.getEatingCalories();
  }
}