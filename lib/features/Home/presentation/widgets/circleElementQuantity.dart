import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleQuantity extends StatelessWidget {
  const CircleQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.all(5),
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black54, width: 5)),
      ),
      Positioned(
        top: 5,
        left: 2,
        child: Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    ]);
  }
}
