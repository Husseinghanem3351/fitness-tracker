abstract class DetailsStates {}

class InitDetailsState extends DetailsStates {}

class LoadingGetDetailsState extends DetailsStates {}

class SuccessGetDetailsState extends DetailsStates {
  List detailsList;

  SuccessGetDetailsState({
    required this.detailsList,
  });
}

class ErrorGetDetailsState extends DetailsStates {
  final String error;

  ErrorGetDetailsState({
    required this.error,
  });
}

class SuccessAddDetailsState extends DetailsStates {
  String message;

  SuccessAddDetailsState({required this.message});
}

class ErrorAddDetailsState extends DetailsStates {
  final String error;

  ErrorAddDetailsState({
    required this.error,
  });
}

class SuccessDeleteDetailsState extends DetailsStates {
  String message;

  SuccessDeleteDetailsState({required this.message});
}

class ErrorDeleteDetailsState extends DetailsStates {
  final String error;

  ErrorDeleteDetailsState({
    required this.error,
  });
}

class UpdateCaloriesSuccessState extends DetailsStates {}

class LoadingGetDailyCaloriesState extends DetailsStates {}

class SuccessGetDailyCaloriesState extends DetailsStates {
  SuccessGetDailyCaloriesState();
}

class ErrorGetDailyCaloriesState extends DetailsStates {
  final String error;

  ErrorGetDailyCaloriesState({
    required this.error,
  });
}

class SwapShowDetailsDuration  extends DetailsStates{}
