
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../global/errors/failure.dart';
import '../entities/eating.dart';
import '../repositories/repositories.dart';

class SearchEatingCalories {
  DetailsRepositories repositories;
  SearchEatingCalories({required this.repositories});

  Future<Either<Failure,List<Eating>>> call( DateTimeRange timeRange)async{
    return await repositories.searchEatingCaloriesIn(timeRange);
  }
}