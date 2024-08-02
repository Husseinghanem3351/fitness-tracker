import 'package:fitness_tracker2/features/Home/presentation/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButtonList extends StatefulWidget {
   RadioButtonList({
    super.key,
    required this.items,
    required this.onChanged,
    this.subItems,
    required this.selectedOption,
  });

  final List<String> items;
  final List<String>? subItems;
  final void Function(String?)? onChanged;
   int selectedOption;

  @override
  State<RadioButtonList> createState() => _RadioButtonListState();
}

class _RadioButtonListState extends State<RadioButtonList> {


  @override
  Widget build(BuildContext context) {
    widget.onChanged!(widget.items[widget.selectedOption]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ...List.generate(
            widget.items.length,
            (index) => buttonItem(
                  widget.items[index],
                  index,
                  subTitle: widget.subItems?[index],
                )),
      ],
    );
  }

  Widget buttonItem(String name, int value, {String? subTitle}) =>
      RadioListTile(
        subtitle: subTitle != null
            ? Text(
                subTitle,
                style: Theme.of(context).textTheme.bodySmall,
              )
            : null,
        title: Text(name,style: Theme.of(context).textTheme.bodyMedium,),
        value: value,
        groupValue: widget.selectedOption,
        onChanged: (value) {
          setState(() {
            widget.selectedOption = value!;
          });
        },
      );
}
