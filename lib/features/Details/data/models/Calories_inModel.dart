import 'package:fitness_tracker2/features/Details/domain/entities/eating.dart';

import '../../../../global/global.dart';

class EatingCaloriesModel extends Eating {
  const EatingCaloriesModel({
     super.date,
    super.id,
    super.quantity,
    super.carb,
    super.fat,
    super.mealName,
    super.protein,
    super.calories,
  });

  factory EatingCaloriesModel.fromJson(Map<String, dynamic> json) {

    return EatingCaloriesModel(
      quantity: json['quantity'],
      id: json['id'],
      date: DateTime.parse(json['date']),
      carb: json['carb'],
      fat: json['fat'],
      protein: json['protein'],
      mealName: json['name'],
      calories: json['calories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
      'date': date!.toIso8601String(),
      'carb':carb,
      'fat':fat,
      'protein':protein,
      'name':mealName,
      'calories':calories,
    };
  }
}
