// import 'package:fitness_tracker2/features/Activities/domain/entities/activity.dart';
// import 'package:fitness_tracker2/features/Activities/presentation/bloc/ActivitiesBloc/states.dart';
// import 'package:fitness_tracker2/features/Activities/presentation/widgets/ActivityElement.dart';
// import 'package:fitness_tracker2/global/widgets/default_button.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../global/widgets/show_toast.dart';
// import '../../../../global/widgets/default_text_form_field.dart';
// import '../bloc/ActivitiesBloc/cubit.dart';
// import '../widgets/CheckBoxTile.dart';
// import '../widgets/add new activity.dart';
//
// class CustomActivity extends StatelessWidget {
//   const CustomActivity({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<Activity> customActivityComponent = [];
//     return ScaffoldMessenger(
//       child: Scaffold(
//         appBar: AppBar(
//           actions: [
//             TextButton(
//               onPressed: () {},
//               child: const Text('save'),
//             ),
//           ],
//         ),
//         body: BlocConsumer<ActivitiesCubit, ActivitiesStates>(
//           builder: (context, state) {
//             if (state is LoadingGetActivitiesState) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is SuccessGetActivitiesState) {
//               ActivitiesCubit.get(context).activities = state.activities;
//             }
//             return Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     child: Text('chose your meal component'),
//                   ),
//                   Expanded(
//                     child: ListView.separated(
//                       itemBuilder: (context, index) => CheckBoxElement(
//                         checkBoxWidget: ActivityElement(
//                           isAddNewActivity: true,
//                           activity:
//                               ActivitiesCubit.get(context).activities[index],
//                         ),
//                         function: (value) {
//                           if (value) {
//                             customActivityComponent.add(
//                                 ActivitiesCubit.get(context).activities[index]);
//                           } else {
//                             customActivityComponent.remove(
//                                 ActivitiesCubit.get(context).activities[index]);
//                           }
//                         },
//                       ),
//                       separatorBuilder: (context, index) => Container(
//                         height: 2,
//                         color: Colors.grey,
//                       ),
//                       itemCount: ActivitiesCubit.get(context).activities.length,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 30.0),
//                     child: DefaultButton(
//                       onPressed: () {
//                         addNewActivitySheet(context);
//                       },
//                       textBtn: 'add new activity',
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           listener: (context, state) {
//             if (state is ErrorGetActivitiesState) {
//               showToast(context: context, msg: state.error, color: Colors.red);
//             } else if (state is ErrorAddActivityState) {
//               showToast(context: context, msg: state.error, color: Colors.red);
//             } else if (state is SuccessAddActivityState) {
//               showToast(
//                   context: context, msg: state.message, color: Colors.green);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
