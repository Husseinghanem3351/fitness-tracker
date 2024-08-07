import 'package:fitness_tracker2/bloc_observer.dart';
import 'package:fitness_tracker2/features/Activities/data/data_sources/ActivityLocalDataSource.dart';
import 'package:fitness_tracker2/features/Activities/data/repositories/ActivityRepoImpl.dart';
import 'package:fitness_tracker2/features/Activities/domain/repositories/ActivityRepository.dart';
import 'package:fitness_tracker2/features/Activities/presentation/bloc/ActivitiesBloc/cubit.dart';
import 'package:fitness_tracker2/features/Details/data/data_sources/LocalDataSource/sqflite%20local%20data%20source.dart';
import 'package:fitness_tracker2/features/Details/data/repositories/repositoryImpl.dart';
import 'package:fitness_tracker2/features/Details/domain/repositories/repositories.dart';
import 'package:fitness_tracker2/features/Details/presentation/bloc/cubit.dart';
import 'package:fitness_tracker2/features/Home/presentation/cubit/cubit.dart';
import 'package:fitness_tracker2/features/Home/presentation/cubit/states.dart';
import 'package:fitness_tracker2/features/Home/presentation/screens/home.dart';
import 'package:fitness_tracker2/features/Home/presentation/screens/info_screen.dart';
import 'package:fitness_tracker2/features/Meals/data/data_sources/LocalDataSource/sqflite%20local%20data%20source.dart';
import 'package:fitness_tracker2/features/Meals/data/repositories/repositoryImpl.dart';
import 'package:fitness_tracker2/features/Meals/domain/repositories/repositories.dart';
import 'package:fitness_tracker2/features/Meals/presentation/bloc/MealsCubit/MealsCubit.dart';
import 'package:fitness_tracker2/global/global_methods.dart';
import 'package:fitness_tracker2/global/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/Home/data/cache helper.dart';
import 'generated/l10n.dart';
import 'global/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await createDatabase();
  await CacheHelper.init();
  deleteOldDate();
  bool isGettingInfo = CacheHelper.getData(key: 'personalInfo') != null;
  final bool? isDark = CacheHelper.getData(key: 'isDark');
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(
      isPersonalInfo: isGettingInfo,
      isDark: isDark,
    ),
  );
}

class MyApp extends StatelessWidget {
  DetailsRepositories detailsRepository() =>
      DetailsRepoImpl(detailsLocalDataSource: DetailsLocalDataSourceImpl());

  ActivityRepository activityRepository() => ActivityRepositoryImpl(
      activityLocalDataSource: ActivityLocalDataSourceImpl());

  MealsRepositories mealsRepositories() =>
      MealsRepoImpl(mealLocalDataSource: MealLocalDataSourceImpl());

  const MyApp({super.key, required this.isPersonalInfo, required this.isDark});

  final bool isPersonalInfo;
  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..changeDarkMode(fromShared: isDark)
            ..calculateMain(),
        ),
        BlocProvider(
          create: (context) => MealsCubit()..getMeals(),
        ),
        BlocProvider(
          create: (context) => ActivitiesCubit()..getActivities(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit()..getDetailsData(),
        ),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          themeMode:
              HomeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: darkTheme,
          theme: lightTheme,
          locale: Locale(language),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: !isPersonalInfo ? const InfoScreen() : const Home(),
        ),
      ),
    );
  }
}
