import 'package:dartz/dartz.dart';

import '../../../../../global/errors/failure.dart';
import '../../entities/activity.dart';
import '../../repositories/ActivityRepository.dart';

class GetActivitiesUseCase{
  ActivityRepository repository;
  GetActivitiesUseCase({required this.repository});

  Future<Either<Failure,List<Activity>>> call () async {
    return await repository.getActivities();
  }
}