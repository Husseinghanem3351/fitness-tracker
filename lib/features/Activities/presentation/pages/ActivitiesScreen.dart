import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/widgets/show_toast.dart';
import '../../../../global/widgets/default_text_form_field.dart';
import '../../domain/entities/activity.dart';
import '../bloc/ActivitiesBloc/cubit.dart';
import '../bloc/ActivitiesBloc/states.dart';
import '../widgets/ListOfActivities.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Future.delayed(const Duration(milliseconds: 200))
                    .then((value) => Navigator.pop(context));
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocConsumer<ActivitiesCubit, ActivitiesStates>(
            builder: (context, state) {
              if (state is LoadingGetActivitiesState) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  DefaultFormField(
                    controller: searchController,
                    textInputType: TextInputType.text,
                    onFieldSubmitted: (value) {
                      ActivitiesCubit.get(context)
                          .searchActivity(searchController.text);
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        ActivitiesCubit.get(context)
                            .searchActivity(searchController.text);
                      }
                    },
                    textInputAction: TextInputAction.search,
                    hintText: S.of(context).search,
                  ),
                  Expanded(child: buildBody(context)),
                ],
              );
            },
            listener: (BuildContext context, ActivitiesStates state) {
              if (state is ErrorGetActivitiesState) {
                showToast(
                    context: context, msg: state.error, color: Colors.red);
              } else if (state is ErrorEditActivityState) {
                showToast(
                    context: context, msg: state.error, color: Colors.red);
              } else if (state is SuccessGetActivitiesState) {
                ActivitiesCubit.get(context).activities = state.activities;
              } else if (state is SuccessEditActivityState) {
                showToast(
                    context: context, msg: state.message, color: Colors.green);
              } else if (state is SuccessDeleteActivityState) {
                showToast(
                    context: context, msg: state.message, color: Colors.green);
              } else if (state is ErrorDeleteActivityState) {
                showToast(
                    context: context, msg: state.error, color: Colors.green);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    List<Activity> activities = ActivitiesCubit.get(context).activities;
    if (activities.isNotEmpty) {
      return ListOfActivities(
        activities: activities,
      );
    } else {
      return const Center(child: Text('database empty'));
    }
  }
}
