import 'package:fitness_tracker2/features/Details/domain/repositories/repositories.dart';
import '../../../../global/errors/failure.dart';
import 'package:dartz/dartz.dart';

class AddBurningCaloriesUseCase{

  DetailsRepositories repository;
  AddBurningCaloriesUseCase({
    required this.repository,
  });

  Future<Either<Failure,Unit>> call(burning) async{
    return await repository.addBurningCalories(burning);
  }
}