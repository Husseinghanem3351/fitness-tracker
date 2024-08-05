import 'package:fitness_tracker2/features/Details/domain/entities/burning.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/cubit.dart';
import 'package:fitness_tracker2/global/widgets/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/global.dart';
import '../../../../global/widgets/default_button.dart';
import '../../../../global/widgets/default_text_form_field.dart';
import '../../../Details/presentation/bloc/states.dart';
import '../../domain/entities/activity.dart';

void addActivityToBurningSheet(context, {required Activity activity}) {
  TextEditingController durationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  showBottomSheet(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              activity.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              children: [
                Text(S.of(context).calories,
                    style: Theme.of(context).textTheme.bodySmall),
                Text(
                  ' ${(info!.weight * activity.MES).round()} ${S.of(context).cal}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Form(
              key: formKey,
              child: DefaultFormField(
                controller: durationController,
                hintText: S.of(context).duration,
                textInputType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  DefaultButton(
                    textBtn: S.of(context).cancel,
                    color: Colors.grey.withOpacity(.1),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  const Spacer(),
                  BlocConsumer<DetailsCubit, DetailsStates>(
                    builder: (context, state) => DefaultButton(
                      textBtn: S.of(context).add,
                      color: Colors.white,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          double calories = (info!.weight * activity.MES) *
                              (int.parse(durationController.text)) /
                              60;
                          DetailsCubit.get(context).addToBurningCalories(
                            Burning(
                              duration: double.parse(durationController.text),
                              date: DateTime.now(),
                              calories: calories.toDouble(),
                              activityName: activity.name,
                            ),
                          );
                        }
                      },
                    ),
                    listener: (context, state) {
                      if (state is SuccessAddDetailsState) {
                        showToast(
                            context: context,
                            msg: state.message,
                            color: Colors.green);
                      }
                      if (state is SuccessGetDetailsState) {
                        DetailsCubit.get(context).details = state.detailsList;
                        DetailsCubit.get(context).showDetails = state.detailsList;
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
