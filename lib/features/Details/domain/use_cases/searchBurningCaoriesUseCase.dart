import 'package:dartz/dartz.dart';
import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import 'package:flutter/material.dart';
import '../../../../global/errors/failure.dart';
import '../repositories/repositories.dart';

class SearchBurningCalories {
  DetailsRepositories repositories;
  SearchBurningCalories({required this.repositories});

  Future<Either<Failure, List<Burning>>> call(DateTimeRange timeRange) async {
    return await repositories.searchBurningCalories(timeRange);
  }
}
