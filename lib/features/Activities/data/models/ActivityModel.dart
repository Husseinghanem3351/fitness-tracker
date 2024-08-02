import '../../domain/entities/activity.dart';

class ActivityModel extends Activity {
  ActivityModel(
      {
        required super.title,
        required super.MES,
       super.id,
      required super.name});

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      title:json['title'],
      MES: json['MES'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title':title,
      'MES': MES,
      'id':id,
      'name':name,
    };
  }

}
