import 'package:fitness_tracker2/features/Activities/presentation/bloc/ActivitiesBloc/states.dart';
import 'package:fitness_tracker2/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../../../../../global/errors/failure.dart';
import '../../../../../global/strings/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/activity.dart';

class ActivitiesCubit extends Cubit<ActivitiesStates> {
  ActivitiesCubit() : super(InitActivitiesState());


  static ActivitiesCubit get(context) => BlocProvider.of(context);


  List<Activity> activities = [];

  Future<void> editActivity(Activity activity) async {
    final failureOrEdit = await ActivitiesUseCases.editActivityUseCase(activity);
    emit(await mapFailureOrActivitiesToState(failureOrEdit, state: 'edit'));
  }

  Future<void> deleteActivity(
    int id,
  ) async {
    final failureOrDelete = await ActivitiesUseCases.deleteActivityUseCase(id);
    emit(await mapFailureOrActivitiesToState(failureOrDelete, state: 'delete'));
  }

  Future<void> addActivity(Activity activity) async {
    final failureOrAdd = await ActivitiesUseCases.addActivityUseCase(activity);
    emit(await mapFailureOrActivitiesToState(failureOrAdd, state: 'add'));
  }

  Future<void> getActivities() async {
    emit(LoadingGetActivitiesState());
    final failureOrGet = await ActivitiesUseCases.getActivityUseCase();
    emit(await mapFailureOrActivitiesToState(failureOrGet, state: 'get'));
  }

  Future<void> searchActivity(String name) async {
    emit(LoadingGetActivitiesState());
    final failureOrSearch = await ActivitiesUseCases.searchActivityUseCase(name);
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
              await getActivities();
              return SuccessDeleteActivityState(
                  message: 'delete activity succeed');
            }
          case 'edit':
            {
              await getActivities();
              return SuccessEditActivityState(message: 'edit activity succeed');
            }
          case 'add':
            {
              await getActivities();
              return SuccessAddActivityState(message: 'add activity succeed');
            }
          default:
            return SuccessGetActivitiesState(activities: activities);
        }
      },
    );
  }
}
