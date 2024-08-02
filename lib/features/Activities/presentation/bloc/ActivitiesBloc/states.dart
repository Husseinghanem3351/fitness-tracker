import '../../../domain/entities/activity.dart';

abstract class ActivitiesStates{}

class InitActivitiesState extends ActivitiesStates{}
class SuccessEditActivityState extends ActivitiesStates{
  final String message;
  SuccessEditActivityState({required this.message});
}
class ErrorEditActivityState extends ActivitiesStates{
  final String error;
  ErrorEditActivityState({required this.error});
}
class SuccessDeleteActivityState extends ActivitiesStates{
  final String message;
  SuccessDeleteActivityState({required this.message});
}
class ErrorDeleteActivityState extends ActivitiesStates{
  final String error;
  ErrorDeleteActivityState({required this.error});
}
class SuccessAddActivityState extends ActivitiesStates{
  final String message;
  SuccessAddActivityState({required this.message});
}
class ErrorAddActivityState extends ActivitiesStates{
  final String error;
  ErrorAddActivityState({required this.error});
}
class LoadingGetActivitiesState extends ActivitiesStates{}
class SuccessGetActivitiesState extends ActivitiesStates{
  List<Activity> activities=[];
  SuccessGetActivitiesState({required this.activities});
}
class ErrorGetActivitiesState extends ActivitiesStates{
  final String error;
  ErrorGetActivitiesState({required this.error});
}
