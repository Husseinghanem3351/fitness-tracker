import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';

class UpdateCaloriesUseCase {
  DetailsRepositories repository;
  UpdateCaloriesUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.updateCalories();
  }
}
