class Eating {
  const Eating({
    this.calories,
     this.date,
     this.id,
     this.quantity,
     this.mealName,
     this.fat,
     this.carb,
     this.protein,
  });

  final int? id;
  final String? mealName;
  final double? quantity;
  final DateTime? date;
  final int? carb;
  final int? fat;
  final int? protein;
  final int? calories;
}
