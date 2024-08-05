import 'package:fitness_tracker2/features/Details/domain/entities/dailyCalories.dart';

class DailyCaloriesModel extends DailyCalories {
  const DailyCaloriesModel({
    super.date,
    super.id,
    super.burningCalories,
    super.eatingCalories,
    super.goalCalories,
    super.fat,
    super.protein,
    super.carb,
  });

  factory DailyCaloriesModel.fromJson(Map<String, dynamic> json) {
    return DailyCaloriesModel(
      date: DateTime.parse(json['date']),
      id: json['id'],
      burningCalories: json['burnedCal'],
      eatingCalories: json['eatingCal'],
      goalCalories: json['goalCalories'],
      carb: json['carb'],
      fat: json['fat'],
      protein: json['protein'],
    );
  }

  Map<String, dynamic> toJson() {
    // var dateFormat=formatter.format(date!);

    return {
      'goalCalories': goalCalories?.round(),
      'date': date.toString().substring(0, 10),
      'burnedCal': burningCalories?.round(),
      'eatingCal': eatingCalories?.round(),
      'protein': protein?.round(),
      'fat': fat?.round(),
      'carb': carb?.round(),
    };
  }
}
