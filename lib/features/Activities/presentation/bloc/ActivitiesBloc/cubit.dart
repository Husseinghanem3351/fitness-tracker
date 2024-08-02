import 'package:fitness_tracker2/features/Activities/presentation/bloc/ActivitiesBloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../../../../../global/errors/failure.dart';
import '../../../../../global/strings/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/activity.dart';
import '../../../domain/use_cases/activityUseCase/addActivity.dart';
import '../../../domain/use_cases/activityUseCase/deleteActivity.dart';
import '../../../domain/use_cases/activityUseCase/editActivity.dart';
import '../../../domain/use_cases/activityUseCase/getActivityies.dart';
import '../../../domain/use_cases/activityUseCase/searchActivity.dart';

class ActivitiesCubit extends Cubit<ActivitiesStates> {
  ActivitiesCubit({
    required this.useCases,
  }) : super(InitActivitiesState());

  final Map<String,dynamic> useCases;

  static ActivitiesCubit get(context) => BlocProvider.of(context);


  List<Activity> activities = [];

  Future<void> editActivity(Activity activity) async {
    final failureOrEdit = await useCases['editActivity'](activity);
    emit(await mapFailureOrActivitiesToState(failureOrEdit, state: 'edit'));
  }

  Future<void> deleteActivity(
    int id,
  ) async {
    final failureOrDelete = await useCases['deleteActivity'](id);
    emit(await mapFailureOrActivitiesToState(failureOrDelete, state: 'delete'));
  }

  Future<void> addActivity(Activity activity) async {
    final failureOrAdd = await useCases['addActivity'](activity);
    emit(await mapFailureOrActivitiesToState(failureOrAdd, state: 'add'));
  }

  Future<void> getAllActivities() async {
    emit(LoadingGetActivitiesState());
    final failureOrGet = await useCases['getActivities']();
    emit(await mapFailureOrActivitiesToState(failureOrGet, state: 'get'));
  }

  Future<void> searchMeal(String name) async {
    emit(LoadingGetActivitiesState());
    final failureOrSearch = await useCases['searchActivity'](name);
    emit(await mapFailureOrActivitiesToState(failureOrSearch, state: 'get'));
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case EmptyDatabase _:
        return emptyFailure;
      case MealNotFound _:
        return mealNotFound;
      default:
        return "UnexpectedError , please try again later";
    }
  }

  Future<ActivitiesStates> mapFailureOrActivitiesToState(
      Either<Failure, dynamic> either,
      {required String state}) async {
    return either.fold(
      (failure) {
        String stringFailure = mapFailureToMessage(failure);
        switch (state) {
          case 'delete':
            return ErrorDeleteActivityState(error: stringFailure);
          case 'edit':
            return ErrorEditActivityState(error: stringFailure);
          case 'add':
            return ErrorAddActivityState(error: stringFailure);
          default:
            return ErrorGetActivitiesState(error: stringFailure);
        }
      },
      (activities) async {
        switch (state) {
          case 'delete':
            {
              await getAllActivities();
              return SuccessDeleteActivityState(
                  message: 'delete activity succeed');
            }
          case 'edit':
            {
              await getAllActivities();
              return SuccessEditActivityState(message: 'edit activity succeed');
            }
          case 'add':
            {
              await getAllActivities();
              return SuccessAddActivityState(message: 'add activity succeed');
            }
          default:
            return SuccessGetActivitiesState(activities: activities);
        }
      },
    );
  }
}
