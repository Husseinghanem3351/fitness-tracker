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
  final int calories;
  final String name;
  final String? defaultValueName;
  final int protein;
  final int carb;
  final int fat;
  final int? defaultValue;
}
