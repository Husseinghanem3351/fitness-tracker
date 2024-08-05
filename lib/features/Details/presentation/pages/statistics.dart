import 'package:fitness_tracker2/features/Details/presentation/bloc/cubit.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/states.dart';
import 'package:fitness_tracker2/features/Details/presentation/widgets/statisticsListItem.dart';
import 'package:fitness_tracker2/global/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<DetailsCubit, DetailsStates>(
        listener: (context, state) {
          if (state is ErrorGetDailyCaloriesState) {
            showToast(context: context, msg: state.error, color: Colors.red);
          }
        },
        builder: (context, state) {
          if (state is LoadingGetDailyCaloriesState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: DetailsCubit.get(context).dailyCalories.length,
            itemBuilder: (context, index) => StatisticsListItem(
              dailyCalories: DetailsCubit.get(context).dailyCalories[index],
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
