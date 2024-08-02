class PersonalInfoModel {
  final double height;
  final double weight;
  final double age;
  final String gender;
  final double waterGoal;
  final String name;

  PersonalInfoModel({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.waterGoal,
    required this.name
  });

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender,
      'waterGoal': waterGoal,
      'name':name,
    };
  }

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    return PersonalInfoModel(
      height: json['height'],
      weight: json['weight'],
      age: json['age'],
      gender: json['gender'],
      waterGoal: json['waterGoal'],
      name:json['name']
    );
  }
}
