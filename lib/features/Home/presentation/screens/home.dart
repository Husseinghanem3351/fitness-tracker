import 'package:fitness_tracker2/features/Details/presentation/bloc/cubit.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/states.dart';
import 'package:fitness_tracker2/features/Home/presentation/screens/infoScreen.dart';
import 'package:fitness_tracker2/features/Home/presentation/widgets/detailsWidget.dart';
import 'package:fitness_tracker2/features/Home/presentation/widgets/gradiant.dart';
import 'package:fitness_tracker2/features/Home/presentation/widgets/waterTracker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../global/global.dart';
import '../../../../global/globalMethods.dart';
import '../../../Details/presentation/pages/details.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/floatingActionButton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) =>
              FloatingButton(
                showAddButton: HomeCubit
                    .get(context)
                    .showAddButton,
              ),
        ),
        appBar: AppBar(),
        body: BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            bool showAddButton = HomeCubit
                .get(context)
                .showAddButton;
            if (remainingCalories == 0) {
              return const Center(child: CircularProgressIndicator());
            }
            return !showAddButton
                ? mainBody(context: context, height: height, width: width)
                : const GradiantWidget();
          },
        ),
        drawer: drawerWidget(context, width: width),
      ),
    );
  }


  Widget mainBody({
    required BuildContext context,
    required double height,
    required double width,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  navigateTo(context, const Details());
                },
                child: Text(
                  S
                      .of(context)
                      .details,
                ),
              ),
              BlocConsumer<DetailsCubit, DetailsStates>(
                builder: (context, state) => DetailsWidget(height: height),
                listener: (context, state) {
                  if (state is SuccessGetDetailsState) {
                    DetailsCubit
                        .get(context)
                        .details = state.detailsList;
                    DetailsCubit
                        .get(context)
                        .showDetails = state.detailsList;
                  }
                },
              ),
              WaterTracker(height: height, width: width),
            ],
          ),
        ),
      );

  Widget drawerWidget(BuildContext context, {
    required double width,
  }) =>
      BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) =>
            Drawer(
              backgroundColor:
              HomeCubit
                  .get(context)
                  .isDark ? Colors.black : Colors.white,
              width: width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      navigateTo(context, const InfoScreen());
                    },
                    color: Colors.red.withOpacity(.5),
                    child: Text(S
                        .of(context)
                        .personalInfo),
                  ),
                  MaterialButton(
                    onPressed: () {
                      HomeCubit.get(context).changeDarkMode();
                    },
                    color: Colors.grey.withOpacity(.5),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(HomeCubit
                          .get(context)
                          .isDark ? S
                          .of(context)
                          .lightMode : S
                          .of(context)
                          .darkMode),
                      Icon(
                        HomeCubit
                            .get(context)
                            .darkModeIcon,
                      ),
                    ]),
                  ),
                  MaterialButton(
                    onPressed: () {
                      HomeCubit.get(context).changeLanguage();
                    },
                    color: Colors.orangeAccent.withOpacity(.5),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(S
                          .of(context)
                          .changeLanguage),
                      const Icon(
                          Icons.language
                      ),
                    ]),
                  ),
                ],
              ),
            ),
      );
}
