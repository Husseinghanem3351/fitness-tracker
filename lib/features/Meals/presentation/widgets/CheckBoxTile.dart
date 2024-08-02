import 'package:flutter/material.dart';

class CheckBoxElement extends StatefulWidget {
  const CheckBoxElement({
    super.key,
    required this.checkBoxWidget,
    required this.function,
  });

  final Widget checkBoxWidget;
  final void Function(bool) function;

  @override
  State<CheckBoxElement> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxElement> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: checkBoxValue,
      title: widget.checkBoxWidget,
      onChanged: (value) {
        widget.function(value!);
        setState(() {
          checkBoxValue = value;
        });
      },
    );
  }
}
