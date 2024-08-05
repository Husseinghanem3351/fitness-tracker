import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final int? maxLines;
  final String? hintText;
  final String? labelText;
  final Text? labelWidget;
  final Text? hintWidget;
  final Widget? prefix;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  const DefaultFormField({super.key,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.labelWidget,
    this.hintWidget,
    this.prefix,
    this.suffix,
    this.validator,
    required this.controller,
    this.onFieldSubmitted,
    this.textInputType,
    this.textInputAction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onChanged: onChanged ,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: textInputType?? TextInputType.name,
        textInputAction: textInputAction?? TextInputAction.done,
        controller: controller,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          label: labelWidget,
          suffixIcon: suffix,
          prefixIcon: prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
