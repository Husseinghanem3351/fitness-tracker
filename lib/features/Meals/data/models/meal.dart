import '../../domain/entities/meal.dart';

class MealModel extends Meal {
  const MealModel({
    super.id,
    required super.name,
    required super.calories,
    required super.protein,
    required super.carb,
    required super.fat,
    // super.defaultValue,
    // super.defaultValueName,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      // defaultValue: json['defaultQuantity'],
      // defaultValueName: json['nameDefaultQuantity'],
      calories: json['calories'],
      id: json['id'],
      name: json['name'],
      fat: json['fat'],
      carb: json['carb'],
      protein: json['protein'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'fat': fat,
      'carb': carb,
      'protein': protein,
      'name': name,
      // 'nameDefaultQuantity':defaultValueName,
      // 'defaultQuantity':defaultValue,
    };
  }
}
