
import 'package:dartz/dartz.dart';

import '../../../../../global/errors/failure.dart';
import '../../repositories/ActivityRepository.dart';
 class DeleteActivityUseCase{
  ActivityRepository repository;
  DeleteActivityUseCase({required this.repository});

  Future<Either<Failure,Unit>> call(int id) async{
    return await repository.deleteActivity(id);
  }
}