import 'package:fitness_tracker2/features/Home/presentation/cubit/cubit.dart';
import 'package:fitness_tracker2/generated/l10n.dart';
import 'package:flutter/material.dart';


class SelectGender extends StatefulWidget {
  const SelectGender({
    super.key,
  });

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFE5E5E5),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: DropdownButton(
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down_sharp),
                value: HomeCubit.get(context).gender=='Male'?S.of(context).male:S.of(context).female,
                items: [
                 S.of(context).male,
                  S.of(context).female,
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: Theme.of(context).textTheme.bodyMedium,),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    HomeCubit.get(context).gender = value==S.of(context).male?'Male':'Female';
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
