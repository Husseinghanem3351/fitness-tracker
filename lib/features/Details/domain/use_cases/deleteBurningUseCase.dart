import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';
import 'package:dartz/dartz.dart';

class DeleteBurningCaloriesUseCase{

  DetailsRepositories repository;
  DeleteBurningCaloriesUseCase({
    required this.repository,
  });

  Future<Either<Failure,Unit>> call(id) async{
    return await repository.deleteBurningCalories(id);
  }
}