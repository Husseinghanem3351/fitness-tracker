import 'package:fitness_tracker2/generated/l10n.dart';
import 'package:fitness_tracker2/global/global.dart';
import 'package:flutter/material.dart';
import '../cubit/cubit.dart';

class WaterTracker extends StatelessWidget {
  const WaterTracker({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow:  [BoxShadow(offset:const Offset(1, 1),color: Colors.grey.withOpacity(.1))]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).waterTracker,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${S.of(context).goal} $waterRequired',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  S.of(context).liter,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: .6,
              crossAxisCount: width ~/ 60,
              children: [
                ...List<Widget>.generate(
                  HomeCubit.get(context).liters ~/ .25,
                  (index) => IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      HomeCubit.get(context)
                          .addGlass(litersChange: (index) * .25);
                    },
                    icon: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.local_drink_outlined,
                          color: Colors.blue,
                          size: 40,
                        ),
                        if ((index+1)*.25>=waterRequired&&(index+1)*.25<=waterRequired+.25)
                          const Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                            size: 15,
                          )
                      ],
                    ),
                  ),
                ),
                if (HomeCubit.get(context).liters < 5)
                  IconButton(
                    onPressed: () {
                      HomeCubit.get(context).addGlass();
                    },
                    icon: const Column(
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 25,
                        ),
                        Icon(
                          Icons.local_drink_outlined,
                          size: 30,
                        )
                      ],
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${HomeCubit.get(context).liters}'),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  S.of(context).liter,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
