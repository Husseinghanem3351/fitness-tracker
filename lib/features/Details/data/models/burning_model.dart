import '../../../../global/global.dart';
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
    return BurningCaloriesModel(
      activityName: json['name'],
      calories: json['calories'].toInt(),
      date: DateTime.parse(json['date']),
      id: json['id'],
      duration: json['duration'],
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
