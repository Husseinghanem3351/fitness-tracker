import 'package:fitness_tracker2/features/Details/presentation/bloc/cubit.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/states.dart';
import 'package:fitness_tracker2/features/Details/presentation/pages/statistics.dart';
import 'package:fitness_tracker2/features/Details/presentation/widgets/DetailsListItem.dart';
import 'package:fitness_tracker2/global/global_methods.dart';
import 'package:fitness_tracker2/global/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/widgets/show_toast.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                color: Colors.blue.withOpacity(.1),
                child: DropdownMenu(
                  hintText: S.of(context).lastWeek,
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                        value: 'weak', label: S.of(context).lastWeek),
                    DropdownMenuEntry(
                        value: 'day', label: S.of(context).lastDay),
                  ],
                  onSelected: (value)  {
                    if(value=='day'){
                      DetailsCubit.get(context).detailsForDayOrWeek(true);
                    }
                    else{
                      DetailsCubit.get(context).detailsForDayOrWeek(false);
                    }
                  },
                ),
              ),
            ],
          ),
          body: BlocConsumer<DetailsCubit, DetailsStates>(
            builder: (BuildContext context, DetailsStates state) {
              if (state is LoadingGetDetailsState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: DetailsCubit.get(context).details.length,
                        itemBuilder: (context, index) => DetailsItem(
                          detailItems: DetailsCubit.get(context).details[index],
                        ),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DefaultButton(
                        color: Theme.of(context).colorScheme.secondary,
                        textBtn: S.of(context).statistics,
                        opacity: 1,
                        onPressed: () {
                          DetailsCubit.get(context).getDailyCaloriesData();
                          navigateTo(context, const Statistics());
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            listener: (context, state) {
              if (state is ErrorGetDetailsState) {
                showToast(
                    context: context, msg: state.error, color: Colors.red);
              } else if (state is SuccessGetDetailsState) {
                DetailsCubit.get(context).details = state.detailsList;
                DetailsCubit.get(context).showDetails = state.detailsList;
              }
            },
          ),
        ),
      ),
    );
  }
}
