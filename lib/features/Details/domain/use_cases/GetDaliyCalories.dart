import 'package:fitness_tracker2/features/Details/domain/entities/dailyCalories.dart';
import 'package:fitness_tracker2/features/Details/domain/repositories/repositories.dart';
import '../../../../global/errors/failure.dart';
import 'package:dartz/dartz.dart';

class GetDailyCaloriesUseCase{

  DetailsRepositories repository;
  GetDailyCaloriesUseCase({
    required this.repository,
  });

  Future<Either<Failure,List<DailyCalories>>> call() async{
    return await repository.getDailyCalories();
  }
}