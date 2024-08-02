
import 'package:dartz/dartz.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';

class GetAllBurningCalories {
  DetailsRepositories repositories;
  GetAllBurningCalories({required this.repositories});

  Future<Either<Failure,List<Burning>>> call()async{
    return await repositories.getBurningCalories();
  }
}