class Meal {
  const Meal({
    this.defaultValue,
    required this.carb,
    required this.fat,
    required this.protein,
    this.id,
    required this.name,
    required this.calories,
    this.defaultValueName,
  });

  final int? id;
  final double calories;
  final String name;
  final String? defaultValueName;
  final double protein;
  final double carb;
  final double fat;
  final double? defaultValue;
}
