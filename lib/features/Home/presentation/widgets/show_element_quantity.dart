import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElementQuantity extends StatelessWidget {
  const ElementQuantity({
    super.key,
    required this.quantity,
    required this.name,
    required this.goal,
  });

  final double quantity;
  final String name;
  final double goal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: 10,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: 58,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: (quantity / goal) * 50 < 50 ? (quantity / goal) * 50 : 50,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.7),
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Text(
          '${quantity.round()} / ${goal.round()}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
