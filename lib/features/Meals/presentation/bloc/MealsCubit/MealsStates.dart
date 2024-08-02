import '../../../domain/entities/meal.dart';

abstract class MealsStates{}

class InitMealsState extends MealsStates{}
class GetMealsSuccessState extends MealsStates{
  final (List<Meal>,List<Meal>) meals;
  GetMealsSuccessState({required this.meals});
}
class GetMealsLoadingState extends MealsStates{}
class GetMealsErrorState extends MealsStates{
  final String error;
  GetMealsErrorState({required this.error});
}
class EditMealsSuccessState extends MealsStates{
  String message;
  EditMealsSuccessState({required this.message});
}
class EditMealsErrorState extends MealsStates{
  final String error;
  EditMealsErrorState({required this.error});
}
class DeleteMealsSuccessState extends MealsStates{
  String message;
  DeleteMealsSuccessState({required this.message});
}
class DeleteMealsErrorState extends MealsStates{
  final String error;
  DeleteMealsErrorState({required this.error});
}
class AddMealsSuccessState extends MealsStates{
  String message;
  AddMealsSuccessState({required this.message});
}
class AddMealsErrorState extends MealsStates{
  final String error;
  AddMealsErrorState({required this.error});
}