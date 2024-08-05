
import 'package:dartz/dartz.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';

class GetBurningCaloriesUseCase {
  DetailsRepositories repository;
  GetBurningCaloriesUseCase({required this.repository});

  Future<Either<Failure,List<Burning>>> call()async{
    return await repository.getBurningCalories();
  }
}