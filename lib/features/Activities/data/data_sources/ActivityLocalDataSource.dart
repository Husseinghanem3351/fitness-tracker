import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../global/database.dart';
import '../../domain/entities/activity.dart';
import '../models/ActivityModel.dart';

abstract class ActivityLocalDataSource {
  Future<Unit> insertToActivities({required ActivityModel activityModel});

  Future<Unit> updateActivityData(Activity activity);

  Future<List<Activity>> getActivityData(Database database);

  Future<List<Activity>> searchActivity(String name);

  Future<Unit> deleteActivitiesData(int id);
}

class ActivityLocalDataSourceImpl implements ActivityLocalDataSource {
  @override
  Future<List<Activity>> getActivityData(Database database) async {
    final value = await database.rawQuery('select * from activities');
    return value.map<ActivityModel>((e) => ActivityModel.fromJson(e)).toList();
  }

  @override
  Future<Unit> insertToActivities(
      {required ActivityModel activityModel}) async {
    try {
      await database.transaction(
          (txn) => txn.insert('activities', activityModel.toJson()));
      getActivityData(database);
    } catch (error) {
      print(error);
    }
    return Future.value(unit);
  }

  @override
  Future<Unit> updateActivityData(Activity activity) async {
    try {
      await database.rawUpdate(
          'update activities set name="${activity.name}",MES=${activity.MES},where id=${activity.id}');
      getActivityData(database);
    } catch (error) {
      print(error);
    }
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteActivitiesData(int id) async {
    try {
      await database.rawDelete('delete from activities where id=$id');
    } catch (error) {
      print(error);
    }
    return Future.value(unit);
  }

  @override
  Future<List<Activity>> searchActivity(String name) async {
    final value = await database
        .rawQuery('select * from activities where name like "%$name%" or title like "%$name%"');
    print(value);
    return value.map<ActivityModel>((e) => ActivityModel.fromJson(e)).toList();
  }
}
