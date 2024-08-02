class DailyCalories {
  final double? eatingCalories;
  final double? burningCalories;
  final double? goalCalories;
  final int? id;
  final DateTime? date;
  final double? fat;
  final double? protein;
  final double? carb;

  const DailyCalories({
    this.fat,
    this.protein,
    this.carb,
    this.eatingCalories,
    this.burningCalories,
    this.goalCalories,
    this.id,
    this.date,
  });
}
