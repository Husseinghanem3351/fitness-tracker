import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';

class UpdateCaloriesUseCase {
  DetailsRepositories repositories;
  UpdateCaloriesUseCase({required this.repositories});

  Future<Either<Failure, Unit>> call() async {
    return await repositories.updateCalories();
  }
}
