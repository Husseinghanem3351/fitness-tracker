import 'package:dartz/dartz.dart';
import 'package:fitness_tracker2/features/Activities/data/models/ActivityModel.dart';

import '../../../../global/database.dart';
import '../../../../global/errors/exception.dart';
import '../../../../global/errors/failure.dart';
import '../../domain/entities/activity.dart';
import '../../domain/repositories/ActivityRepository.dart';
import '../data_sources/ActivityLocalDataSource.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityLocalDataSource activityLocalDataSource;

  ActivityRepositoryImpl({required this.activityLocalDataSource});

  @override
  Future<Either<Failure, Unit>> addActivity(Activity activity) async {
    ActivityModel activityModel=ActivityModel(MES: activity.MES,  name: activity.name,title: activity.title);
    try {
      await activityLocalDataSource.insertToActivities(
        activityModel:  activityModel
      );
      return const Right(unit);
    } on ServerException {
      return Left(DatabaseNotFound());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteActivity(int id) async {
    try{
      await activityLocalDataSource.deleteActivitiesData(id);
      return const Right(unit);
    }
        on ServerException {
      return Left(DatabaseNotFound());
        }
  }

  @override
  Future<Either<Failure, Unit>> editActivity(Activity activity) async {
    try{
      await activityLocalDataSource.updateActivityData(activity);
      return const Right(unit);
    }
        on ServerException{
      return Left(DatabaseNotFound());
        }
  }

  @override
  Future<Either<Failure, List<Activity>>> getActivities() async{
    try{
     List<Activity> activities= await activityLocalDataSource.getActivityData(database);
      return Right(activities);
    }
        on ServerException{
      return Left(DatabaseNotFound());
        }
  }

  @override
  Future<Either<Failure, List<Activity>>> searchActivities(String name) async{
  try{
    List<Activity> activities = await activityLocalDataSource.searchActivity(name);
    return Right(activities);
  }
  on ServerException{
    return Left(DatabaseNotFound());
  }
  }



}
