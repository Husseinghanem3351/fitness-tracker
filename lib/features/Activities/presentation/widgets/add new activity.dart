import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../global/global_methods.dart';
import '../../../../global/widgets/default_button.dart';
import '../../../../global/widgets/default_text_form_field.dart';
import '../../domain/entities/activity.dart';
import '../bloc/ActivitiesBloc/cubit.dart';

void addNewActivitySheet(context) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();
  showBottomSheet(
    context: context,
    builder: (context) => BottomSheet(
      onClosing: () {},
      builder: (context) => Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultFormField(
                controller: nameController,
                hintText: S.of(context).activityName,
                validator: (value) {
                  return validatorMethod(value,context);
                },
              ),
              DefaultFormField(
                controller: caloriesController,
                hintText: S.of(context).caloriesPerHour,
                validator: (value) {
                  return validatorMethod(value,context);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DefaultButton(
                      textBtn: S.of(context).cancel,
                      color: Colors.grey.withOpacity(.1),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DefaultButton(
                      textBtn: S.of(context).confirm,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ActivitiesCubit.get(context).addActivity(
                            Activity(
                              name: nameController.text,
                              MES:
                              double.parse(caloriesController.text),
                              title: '',
                            ),
                          );
                          nameController.clear();
                          caloriesController.clear();
                          Navigator.of(context).pop(false);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
