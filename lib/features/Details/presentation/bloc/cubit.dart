import 'package:fitness_tracker2/features/Details/data/data_sources/LocalDataSource/sqflite%20local%20data%20source.dart';
import 'package:fitness_tracker2/features/Details/data/repositories/repositoryImpl.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/dailyCalories.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/eating.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/GetDaliyCalories.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/UpdateCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/addEatngCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/deleteBurningUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/getEatingCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/states.dart';
import 'package:fitness_tracker2/global/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../global/errors/failure.dart';
import '../../../../global/strings/failures.dart';
import '../../data/models/Calories_inModel.dart';
import '../../domain/use_cases/addBurningCaloriesUseCase.dart';
import '../../domain/use_cases/deleteEatingCaloriesUseCase.dart';
import '../../domain/use_cases/getBurningCaloriesUseCase.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit({
    required this.useCases,
  }) : super(InitDetailsState());

  static DetailsCubit get(context) => BlocProvider.of(context);
  Map<String,dynamic>useCases ;

  //
  // GetAllEatingCalories getAllEatingCalories = GetAllEatingCalories(
  //   repositories: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );
  // GetAllBurningCalories getAllBurningCalories = GetAllBurningCalories(
  //   repositories: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );
  // AddEatingCaloriesUseCase addEatingCaloriesUseCase = AddEatingCaloriesUseCase(
  //   repository: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );
  // AddBurningCaloriesUseCase addBurningCaloriesUseCase =
  //     AddBurningCaloriesUseCase(
  //   repository: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );
  // DeleteBurningCalories deleteBurningCaloriesUseCase = DeleteBurningCalories(
  //   repository: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );
  // DeleteEatingCalories deleteEatingCaloriesUseCase = DeleteEatingCalories(
  //   repository: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );
  // UpdateCaloriesUseCase updateCaloriesUseCase = UpdateCaloriesUseCase(
  //   repositories: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );
  // GetDailyCaloriesUseCase getDailyCaloriesUseCase = GetDailyCaloriesUseCase(
  //   repository: DetailsRepoImpl(
  //     detailsLocalDataSource: DetailsLocalDataSourceImpl(),
  //   ),
  // );

  List details = [];
  List showDetails = []; // if day I will show just day details
  List<DailyCalories> dailyCalories = [];

  Future<void> getDetailsData() async {
    emit(LoadingGetDetailsState());
    final failureOrEatingCalories = await useCases['getEatingCalories']();
    final failureOrBurningCalories = await useCases['getBurningCalories']();
    emit(await mapResultGetToState(
        failureOrEatingCalories, failureOrBurningCalories));
    useCases['updateCalories']().then((value) {
      calculateDetailsCalories();
      emit(UpdateCaloriesSuccessState());
    }).catchError((error) {});
  }

  void calculateDetailsCalories() {
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
        }
      }
      i++;
    }
  }

  Future<void> getDailyCaloriesData() async {
    // get details for each day, for statistics
    emit(LoadingGetDailyCaloriesState());
    useCases['getDailyCalories']().then((value) {
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
    final addOrFailure = await useCases['addEatingCalories'](eatingElement);
    emit(await mapResultToState(either: addOrFailure, state: 'add'));
  }

  Future<void> addToBurningCalories(Burning burningElement) async {
    final addOrFailure = await useCases['addBurningCalories'](burningElement);
    emit(await mapResultToState(either: addOrFailure, state: 'add'));
  }

  Future<void> deleteBurningCalories(int id) async {
    final deleteOrFailure = await useCases['deleteBurningCalories'](id);
    emit(await mapResultToState(either: deleteOrFailure, state: 'delete'));
  }

  Future<void> deleteEatingCalories(int id) async {
    final deleteOrFailure = await useCases['deleteEatingCalories'](id);
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
        return eitherBurning.fold((failure) {
          return ErrorGetDetailsState(error: 'get burning error');
        }, (burning) {
          return SuccessGetDetailsState(
            detailsList: sortTwoList(
              eating,
              burning,
            ),
          );
        });
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
