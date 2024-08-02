

import 'package:dartz/dartz.dart';

import '../../../../global/errors/failure.dart';
import '../entities/activity.dart';

 abstract class ActivityRepository{
  Future<Either<Failure,Unit>> addActivity(Activity activity);
  Future<Either<Failure,Unit>> editActivity(Activity activity);
  Future<Either<Failure,Unit>> deleteActivity(int id);
  Future<Either<Failure,List<Activity>>> getActivities();
  Future<Either<Failure,List<Activity>>> searchActivities(String name);
}