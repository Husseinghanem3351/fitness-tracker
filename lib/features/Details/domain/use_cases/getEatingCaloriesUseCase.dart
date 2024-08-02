
import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../entities/eating.dart';
import '../repositories/repositories.dart';

class GetAllEatingCalories {
  DetailsRepositories repositories;
  GetAllEatingCalories({required this.repositories});

  Future<Either<Failure,List<Eating>>> call()async{
    return await repositories.getEatingCalories();
  }
}