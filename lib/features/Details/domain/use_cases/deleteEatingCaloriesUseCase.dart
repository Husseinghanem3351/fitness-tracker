import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';
import 'package:dartz/dartz.dart';

class DeleteEatingCalories{

  DetailsRepositories repository;
  DeleteEatingCalories({
    required this.repository,
  });

  Future<Either<Failure,Unit>> call(id) async{
    return await repository.deleteEatingCalories(id);
  }
}