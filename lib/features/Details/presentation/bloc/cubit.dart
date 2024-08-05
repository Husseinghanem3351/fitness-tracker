import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/dailyCalories.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/eating.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/states.dart';
import 'package:fitness_tracker2/global/global.dart';
import 'package:fitness_tracker2/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../../../../global/strings/failures.dart';
import '../../../Home/data/cache helper.dart';
import '../../data/models/Calories_inModel.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit() : super(InitDetailsState());

  static DetailsCubit get(context) => BlocProvider.of(context);

  List details = [];
  List showDetails = []; // if day I will show just day details
  List<DailyCalories> dailyCalories = [];

  Future<void> getDetailsData() async {
    emit(LoadingGetDetailsState());
    final failureOrEatingCalories =
        await DetailsUseCases.getEatingCalorieUseCase();
    final failureOrBurningCalories =
        await DetailsUseCases.getBurningCaloriesUseCase();
    emit(await mapResultGetToState(
        failureOrEatingCalories, failureOrBurningCalories));
    DetailsUseCases.updateCalorieUseCase().then((value) {
      calculateDetailsCalories();
      emit(UpdateCaloriesSuccessState());
    }).catchError((error) {});
  }

  Future<void> calculateDetailsCalories() async {
    remainingCalories = remainingCalories - burningCalories + eatingCalories;
    globalCarb = 0;
    globalProtein = 0;
    globalFat = 0;
    eatingCalories = 0;
    burningCalories = 0;
    int i = 0;
    while (i < details.length) {
      if (details[i].date.day == DateTime.now().day) {
        if (details[i].runtimeType == EatingCaloriesModel) {
          remainingCalories -= details[i].calories;
          globalCarb += details[i].carb;
          globalProtein += details[i].protein;
          globalFat += details[i].fat;
          eatingCalories += details[i].calories;
        } else {
          remainingCalories += details[i].calories;
          burningCalories += details[i].calories;
          String goal = await CacheHelper.getData(key: 'goal');
          switch (goal) {
            case 'lose weight' || 'خسارة وزن':
              {
                requiredProtein = (.3 * remainingCalories) / 4;
                requiredFat = (.25 * remainingCalories) / 9;
                requiredCarb = (.45 * remainingCalories) / 4;
              }
            case 'gain weight' || 'زيادة وزن':
              {
                requiredProtein = (.25 * remainingCalories) / 4;
                requiredFat = (.25 * remainingCalories) / 9;
                requiredCarb = (.5 * remainingCalories) / 4;
              }
            case 'build muscle' || 'بناء عضلات':
              {
                requiredProtein = (.25 * remainingCalories) / 4;
                requiredFat = (.25 * remainingCalories) / 9;
                requiredCarb = (.5 * remainingCalories) / 4;
              }
            default:
              {
                requiredProtein = (.2 * remainingCalories) / 4;
                requiredFat = (.3 * remainingCalories) / 9;
                requiredCarb = (.5 * remainingCalories) / 4;
              }
          }
        }
      }
      i++;
    }
  }

  Future<void> getDailyCaloriesData() async {
    // get details for each day, for statistics
    emit(LoadingGetDailyCaloriesState());
    DetailsUseCases.getDailyCalorieUseCase().then((value) {
      value.fold((failure) {
        emit(ErrorGetDailyCaloriesState(
            error: mapFailureToMessage(
          failure,
        )));
      }, (data) {
        dailyCalories = data;
        emit(SuccessGetDailyCaloriesState());
      });
    });
  }

  Future<void> addToEatingCalories(Eating eatingElement) async {
    final addOrFailure =
        await DetailsUseCases.addEatingCaloriesUseCase(eatingElement);
    emit(await mapResultToState(either: addOrFailure, state: 'add'));
  }

  Future<void> addToBurningCalories(Burning burningElement) async {
    final addOrFailure =
        await DetailsUseCases.addBurningCaloriesUseCase(burningElement);
    emit(await mapResultToState(either: addOrFailure, state: 'add'));
  }

  Future<void> deleteBurningCalories(int id) async {
    final deleteOrFailure =
        await DetailsUseCases.deleteBurningCaloriesUseCase(id);
    emit(await mapResultToState(either: deleteOrFailure, state: 'delete'));
  }

  Future<void> deleteEatingCalories(int id) async {
    final deleteOrFailure = await DetailsUseCases.deleteEatingCalorieUseCse(id);
    emit(await mapResultToState(either: deleteOrFailure, state: 'delete'));
  }

  Future<DetailsStates> mapResultGetToState(
    Either<Failure, List<Eating>> eitherEating,
    Either<Failure, List<Burning>> eitherBurning,
  ) async {
    return await eitherEating.fold(
      (failure) {
        return ErrorGetDetailsState(error: 'get eating error');
      },
      (eating) {
        return eitherBurning.fold(
          (failure) {
            return ErrorGetDetailsState(error: 'get burning error');
          },
          (burning) {
            return SuccessGetDetailsState(
              detailsList: sortTwoList(
                eating,
                burning,
              ),
            );
          },
        );
      },
    );
  }

  Future<DetailsStates> mapResultToState({
    required Either<Failure, Unit> either,
    required String state,
  }) async {
    return await either.fold(
      (failure) async {
        switch (state) {
          case 'add':
            {
              return ErrorAddDetailsState(error: mapFailureToMessage(failure));
            }
          default:
            {
              return ErrorDeleteDetailsState(
                  error: mapFailureToMessage(failure));
            }
        }
      },
      (unit) async {
        await getDetailsData();
        switch (state) {
          case 'add':
            {
              return SuccessAddDetailsState(message: 'added success');
            }
          default:
            {
              return SuccessDeleteDetailsState(message: 'meal delete succeed');
            }
        }
      },
    );
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

  List sortTwoList(List<Eating> eatingCalories, List<Burning> burningCalories) {
    List details = [...eatingCalories, ...burningCalories];
    details.sort(
      (a, b) {
        return b.date.compareTo(a.date);
      },
    );
    return details;
  }

  void detailsForDayOrWeek(bool isDay) {
    if (isDay) {
      details = showDetails
          .map(
            (e) {
              if (DateTime.now()
                      .difference(DateTime.parse(e.date.toString()))
                      .inHours <
                  24) {
                return e;
              }
            },
          )
          .nonNulls
          .toList();
    } else {
      details = showDetails;
    }
    print(details);
    emit(SwapShowDetailsDuration());
  }
}
