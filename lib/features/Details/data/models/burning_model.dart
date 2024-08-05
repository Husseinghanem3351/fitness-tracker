
import '../../domain/entities/burning.dart';

class BurningCaloriesModel extends Burning {
  const BurningCaloriesModel({
     super.date,
     super.duration,
     super.activityName,
     super.calories,
    super.id,
  });

  factory BurningCaloriesModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return BurningCaloriesModel(
      activityName: json['name'].toString(),
      calories: double.parse(json['calories']).toDouble(),
      date: DateTime.parse(json['date']),
      id: int.parse(json['id']),
      duration: double.parse(json['duration']).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'date': date!.toIso8601String(),
      'calories':calories,
      'name':activityName,
    };
  }
}
