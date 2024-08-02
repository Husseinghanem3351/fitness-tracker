import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class GradiantWidget extends StatelessWidget {
  const GradiantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if(didPop) {
          HomeCubit.get(context).changeAddButtonState();
          HomeCubit.get(context).showAddButton;
        }
      },
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (BuildContext context, HomeStates state) {
          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  HomeCubit.get(context).isDark ? Colors.black : Colors.white,
                ],
                radius: .8,
              ),
            ),
          );
        },
      ),
    );
  }
}
