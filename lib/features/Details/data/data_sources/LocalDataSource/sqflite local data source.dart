import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:fitness_tracker2/features/Details/data/models/Calories_inModel.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/dailyCalories.dart';
import 'package:fitness_tracker2/global/global.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../../global/database.dart';
import '../../../domain/entities/burning.dart';
import '../../../domain/entities/eating.dart';
import '../../models/burning_model.dart';
import '../../models/dailyCaloriesModel.dart';

abstract class DetailsLocalDataSource {
  Future<Unit> deleteEatingCaloriesData(int id);

  Future<List<Eating>> getEatingCaloriesData(Database database);

  Future<Unit> insertToEating(EatingCaloriesModel eatingCaloriesModel);

  Future<List<Eating>> searchEatingCaloriesData(DateTimeRange dateTimeRange);

  Future<Unit> deleteBurningCaloriesData(int id);

  Future<List<Burning>> getBurningCaloriesData(Database database);

  Future<Unit> insertToBurning(BurningCaloriesModel burningCaloriesModel);

  Future<Unit> updateCalories();

  Future<List<Burning>> searchBurningCaloriesData(DateTimeRange dateTimeRange);

  Future<List<DailyCalories>> getDailyCaloriesData();
}

class DetailsLocalDataSourceImpl implements DetailsLocalDataSource {
  @override
  Future<List<Eating>> getEatingCaloriesData(Database database) async {
    List<Eating> eatingCalories = [];
    try {
      List<Map<String, Object?>> eating =
          await database.rawQuery('select * from eating');
      eatingCalories = eating.map<Eating>((e) {
        if (DateTime.now()
                .difference(DateTime.parse(e['date'].toString()))
                .inDays >
            7) {
          database.rawQuery('delete from eating where id =${e['id']}');
        }
        return EatingCaloriesModel.fromJson(e);
      }).toList();
      return eatingCalories;
    } catch (error) {
      throw DatabaseException;
    }
  }

  @override
  Future<Unit> insertToEating(EatingCaloriesModel eatingCaloriesModel) async {
    try {
      await database.transaction((txn) => txn.insert(
            'eating',
            eatingCaloriesModel.toJson(),
          ));
      return unit;
    } catch (error) {
      throw DatabaseException;
    }
  }

  @override
  Future<Unit> deleteEatingCaloriesData(int id) async {
    try {
      await database.transaction(
          (txn) => txn.rawDelete('delete from eating where id =$id'));
      return unit;
    } catch (error) {
      throw DatabaseException;
    }
  }

  @override
  Future<List<Eating>> searchEatingCaloriesData(DateTimeRange range) async {
    late final List<EatingCaloriesModel> eatingCalories;
    try {
      await database
          .rawQuery(
              'select * from eating where DATE(date) >=${range.start} And DATE(date)<= ${range.end}')
          .then((value) {
        eatingCalories = value
            .map<EatingCaloriesModel>((e) => EatingCaloriesModel.fromJson(e))
            .toList();
      });
      return eatingCalories;
    } catch (error) {
      throw DatabaseException;
    }
  }

  @override
  Future<Unit> updateCalories() async {
    // DateFormat formatter=DateFormat('YYYY-MM-DD');
    String currentDate = DateTime.now().toString().substring(0, 10);
    DateTime date = DateTime.now();
    // var dateFormat=formatter.format(date);
    List<Map<String, Object?>> dailyCalories = await database
        .rawQuery('select * from dailyCalories where date=?', [currentDate]);

    DailyCaloriesModel dailyCaloriesModel = DailyCaloriesModel(
      goalCalories: eatRemainingCalories,
      eatingCalories: eatingCalories,
      burningCalories: burningCalories,
      date: date,
      fat: eatingFat,
      protein: eatingProtein,
      carb: eatingCarb,
    );
    if (dailyCalories.isEmpty) {
      await database.transaction((txn) => txn.insert(
            'dailyCalories',
            dailyCaloriesModel.toJson(),
          ));
      return unit;
    } else {
      await database.transaction((txn) => txn.update(
            'dailyCalories',
            dailyCaloriesModel.toJson(),
            where: 'date=?',
            whereArgs: [currentDate],
          ));
    }
    return Future.value(unit);
  }

  @override
  Future<List<Burning>> getBurningCaloriesData(Database database) async {
    late final List<Burning> burningCalories;
    try {
      List<Map<String, Object?>> burning =
          await database.rawQuery('select * from burning');
      burningCalories = burning.map<Burning>((e) {
        if (DateTime.now()
                .difference(DateTime.parse(e['date'].toString()))
                .inDays >
            7) {
          database.rawQuery('delete from burning where id =${e['id']}');
        }
        return BurningCaloriesModel.fromJson(e);

      }).toList();
      return burningCalories;
    } catch (error) {
      print(error);
      throw DatabaseException;
    }
  }

  @override
  Future<Unit> insertToBurning(
      BurningCaloriesModel burningCaloriesModel) async {
    try {
      await database.transaction((txn) => txn.insert(
            'burning',
            burningCaloriesModel.toJson(),
          ));
      return unit;
    } catch (error) {
      throw DatabaseException;
    }
  }

  @override
  Future<Unit> deleteBurningCaloriesData(int id) async {
    try {
      await database.transaction(
          (txn) => txn.rawDelete('delete from burning where id =$id)'));
      return unit;
    } catch (error) {
      throw DatabaseException;
    }
  }

  @override
  Future<List<Burning>> searchBurningCaloriesData(DateTimeRange range) async {
    late final List<BurningCaloriesModel> burningCalories;
    try {
      await database
          .rawQuery(
              'select * from burning where DATE(date) >=${range.start} And DATE(date)<= ${range.end}')
          .then((value) {
        burningCalories = value
            .map<BurningCaloriesModel>((e) => BurningCaloriesModel.fromJson(e))
            .toList();
      });
      return burningCalories;
    } catch (error) {
      throw DatabaseException;
    }
  }

  @override
  Future<List<DailyCalories>> getDailyCaloriesData() async {
    try {
      List<Map<String, Object?>> data =
          await database.rawQuery('select * from dailyCalories ORDER by date DESC');
      return data
          .map<DailyCaloriesModel>((e) => DailyCaloriesModel.fromJson(e))
          .toList();
    } catch (error) {
      // print(error);
      throw DatabaseException;
    }
  }
}
