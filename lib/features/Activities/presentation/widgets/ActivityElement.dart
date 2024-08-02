import 'package:fitness_tracker2/features/Activities/domain/entities/activity.dart';
import 'package:fitness_tracker2/global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../generated/l10n.dart';
import '../../../Home/presentation/cubit/cubit.dart';

class ActivityElement extends StatelessWidget {
  const ActivityElement({
    super.key,
    required this.activity,
  });

  final Activity activity;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow:  [BoxShadow(offset:const Offset(1, 1),color: Colors.grey.withOpacity(.1))]
      ),
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: [
          Text(activity.title),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                S.of(context).activity,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Text(
                  activity.name,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                S.of(context).calories,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 20,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${(info!.weight*activity.MES).round()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 10,),
                  Text(S.of(context).cal,style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
