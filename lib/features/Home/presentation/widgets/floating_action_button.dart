import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../../global/global_methods.dart';
import '../../../../global/widgets/default_button.dart';
import '../../../Activities/presentation/pages/ActivitiesScreen.dart';
import '../../../Meals/presentation/pages/mealsScreen.dart';
import '../cubit/cubit.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton({
    super.key,
    required this.showAddButton,
  });
  bool showAddButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showAddButton)
         ... [SizedBox(
            height: 65,
            child: DefaultButton(
              paddingContent: 0,
              color: Colors.green,
              onPressed: () {
                navigateTo(context, const MealsScreen());
              },
              btn:  Text(
                S.of(context).meals,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              shapeBorder: const CircleBorder(),
            ),
          ),
          SizedBox(
            height: 65,
            child: DefaultButton(
              paddingContent: 0,
              color: Colors.red,
              onPressed: () {
                navigateTo(context, const ActivitiesScreen());
              },
              btn: Text(
                S.of(context).activity,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              shapeBorder: const CircleBorder(),
            ),
          ),],
        FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            HomeCubit.get(context).changeAddButtonState();
          },
          child:
              Icon(showAddButton ? Icons.arrow_downward_outlined : Icons.add),
        ),
      ],
    );
  }
}
