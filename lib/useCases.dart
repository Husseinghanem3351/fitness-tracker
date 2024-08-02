import 'package:fitness_tracker2/features/Activities/data/data_sources/ActivityLocalDataSource.dart';
import 'package:fitness_tracker2/features/Activities/data/repositories/ActivityRepoImpl.dart';
import 'package:fitness_tracker2/features/Activities/domain/repositories/ActivityRepository.dart';
import 'package:fitness_tracker2/features/Activities/domain/use_cases/activityUseCase/addActivity.dart';
import 'package:fitness_tracker2/features/Activities/domain/use_cases/activityUseCase/deleteActivity.dart';
import 'package:fitness_tracker2/features/Activities/domain/use_cases/activityUseCase/editActivity.dart';
import 'package:fitness_tracker2/features/Activities/domain/use_cases/activityUseCase/getActivityies.dart';
import 'package:fitness_tracker2/features/Activities/domain/use_cases/activityUseCase/searchActivity.dart';
import 'package:fitness_tracker2/features/Details/data/data_sources/LocalDataSource/sqflite%20local%20data%20source.dart';
import 'package:fitness_tracker2/features/Details/data/repositories/repositoryImpl.dart';
import 'package:fitness_tracker2/features/Details/domain/repositories/repositories.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/GetDaliyCalories.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/UpdateCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/addBurningCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/addEatngCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/deleteBurningUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/deleteEatingCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/getBurningCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Details/domain/use_cases/getEatingCaloriesUseCase.dart';
import 'package:fitness_tracker2/features/Meals/data/data_sources/LocalDataSource/sqflite%20local%20data%20source.dart';
import 'package:fitness_tracker2/features/Meals/data/repositories/repositoryImpl.dart';
import 'package:fitness_tracker2/features/Meals/domain/repositories/repositories.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/addMeal.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/deleteMeal.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/getAllMeals.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/searchMeal.dart';
import 'package:fitness_tracker2/features/Meals/domain/use_cases/updateMeal.dart';

Map<String, dynamic> detailsUseCases() {
  DetailsRepositories detailsRepository =
      DetailsRepoImpl(detailsLocalDataSource: DetailsLocalDataSourceImpl());
  MealsRepositories mealsRepository =
      MealsRepoImpl(mealLocalDataSource: MealLocalDataSourceImpl());
  ActivityRepository activityRepository = ActivityRepositoryImpl(
      activityLocalDataSource: ActivityLocalDataSourceImpl());
  return {
    'getEatingCalories': GetAllEatingCalories(repositories: detailsRepository),
    'getBurningCalories':
        GetAllBurningCalories(repositories: detailsRepository),
    'updateCalories': UpdateCaloriesUseCase(repositories: detailsRepository),
    'getDailyCalories': GetDailyCaloriesUseCase(repository: detailsRepository),
    'addEatingCalories':
        AddEatingCaloriesUseCase(repository: detailsRepository),
    'addBurningCalories':
        AddBurningCaloriesUseCase(repository: detailsRepository),
    'deleteBurningCalories':
        DeleteBurningCalories(repository: detailsRepository),
    'deleteEatingCalories': DeleteEatingCalories(repository: detailsRepository),
  };
}

Map<String, dynamic> activitiesUseCases() {
  ActivityRepository activityRepository = ActivityRepositoryImpl(
      activityLocalDataSource: ActivityLocalDataSourceImpl());
  return {
    'editActivity': EditActivityUseCase(repository: activityRepository),
    'deleteActivity': DeleteActivityUseCase(repository: activityRepository),
    'addActivity': AddActivityUseCase(repository: activityRepository),
    'searchActivity':
        SearchActivityUseCase(activityRepository: activityRepository),
    'getActivities': GetActivitiesUseCase(repository: activityRepository),
  };
}

Map<String, dynamic> mealsUseCases() {
  MealsRepositories mealsRepositories =
      MealsRepoImpl(mealLocalDataSource: MealLocalDataSourceImpl());
  return {
    'addMeal': AddMealUseCase(
      repository: mealsRepositories,
    ),
    'deleteMeal': DeleteMealUseCase(
      repositories: mealsRepositories,
    ),
    'searchMeal': SearchMealUseCase(
      repositories: mealsRepositories,
    ),
    'getMeals': GetAllMealsUseCase(
      repositories: mealsRepositories,
    ),
    'updateMeal': UpdateMealUseCase(
      repositories: mealsRepositories,
    ),
  };
}

class MealsUseCases{

}
