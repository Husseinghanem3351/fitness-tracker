import 'package:dartz/dartz.dart';
import '../../../../../global/errors/failure.dart';
import '../../entities/activity.dart';
import '../../repositories/ActivityRepository.dart';

class SearchActivityUseCase {
  ActivityRepository repository;
  SearchActivityUseCase({required this.repository});

  Future<Either<Failure,List<Activity>>>call(String name) async {
   return await repository.searchActivities(name);
  }
}