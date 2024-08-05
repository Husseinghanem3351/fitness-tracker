import 'package:fitness_tracker2/features/Meals/domain/entities/meal.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/addMeal.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/deleteMeal.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/getAllMeals.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/searchMeal.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/updateMeal.dart';
import 'package:fitness_tracker2/use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../../global/errors/failure.dart';
import '../../../../../global/strings/failures.dart';
import 'MealsStates.dart';

class MealsCubit extends Cubit<MealsStates> {
  MealsCubit() : super(InitMealsState());


  static MealsCubit get(context) => BlocProvider.of(context);

  List<Meal> meals = [];
  List<Meal> basicMeals = [];

  Future<void> searchMeal(String name) async {
    emit(GetMealsLoadingState());
    final failureOrSearch = await MealsUseCases.searchMealUseCase(name);
    emit(await mapFailureOrSuccess(either: failureOrSearch, state: 'get'));
  }

  Future<void> getMeals() async {
    emit(GetMealsLoadingState());
    final failureOrGet = await MealsUseCases.getMealsUseCase();
    emit(await mapFailureOrSuccess(either: failureOrGet, state: 'get'));
  }

  Future<void> editMeal(Meal meal) async {
    final failureOrEdit = await MealsUseCases.updateMealUseCase(meal);
    emit(
      await mapFailureOrSuccess(
        either: failureOrEdit,
        state: 'edit',
      ),
    );
  }

  Future<void> deleteMeal(int id) async {
    final failureOrDelete = await MealsUseCases.deleteMealUseCase(id);
    emit(
      await mapFailureOrSuccess(
        either: failureOrDelete,
        state: 'delete',
      ),
    );
  }

  Future<void> addMeal(Meal meal) async {
    final failureOrAdd = await MealsUseCases.addMealUseCase(meal);
    emit(
      await mapFailureOrSuccess(
        either: failureOrAdd,
        state: 'add',
      ),
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

  Future<MealsStates> mapFailureOrSuccess({
    required Either<Failure, dynamic> either,
    required String state,
  }) async {
    return either.fold(
      (failure) {
        String stringFailure = mapFailureToMessage(failure);
        switch (state) {
          case 'delete':
            return DeleteMealsErrorState(error: stringFailure);
          case 'edit':
            return EditMealsErrorState(error: stringFailure);
          case 'add':
            return AddMealsErrorState(error: stringFailure);
          default:
            return GetMealsErrorState(error: stringFailure);
        }
      },
      (meals) async {
        switch (state) {
          case 'delete':
            {
              await getMeals();
              return DeleteMealsSuccessState(message: 'delete meal succeed');
            }
          case 'edit':
            {
              await getMeals();
              return EditMealsSuccessState(message: 'edit meal succeed');
            }
          case 'add':
            {
              await getMeals();
              return AddMealsSuccessState(message: 'add meal succeed');
            }
          default:
            return GetMealsSuccessState(meals: meals);
        }
      },
    );
  }
}
