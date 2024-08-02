import 'package:fitness_tracker2/features/Home/presentation/widgets/selectGender.dart';
import 'package:fitness_tracker2/generated/l10n.dart';
import 'package:fitness_tracker2/global/globalMethods.dart';
import 'package:fitness_tracker2/global/globalMethods.dart';
import 'package:fitness_tracker2/global/globalMethods.dart';
import 'package:fitness_tracker2/global/globalMethods.dart';
import 'package:fitness_tracker2/global/widgets/defaultTextFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'infoScreen.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({
    super.key,
    required this.weightController,
    required this.nameController,
    required this.ageController,
    required this.heightController,
  });
  final TextEditingController weightController;

  final TextEditingController nameController;

  final TextEditingController ageController;

  final TextEditingController heightController;

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return body(
      context: context,
      weightController: widget.weightController,
      nameController: widget.nameController,
      ageController: widget.ageController,
      heightController: widget.heightController,
    );
  }
}

Widget body({
  required BuildContext context,
  required TextEditingController weightController,
  required TextEditingController nameController,
  required TextEditingController ageController,
  required TextEditingController heightController,
}) {
  return Form(
    key: formKey,
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(S.of(context).personalInfo,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(
            height: 10,
          ),
          DefaultFormField(
            hintText: S.of(context).name,
            controller: nameController,
            validator: (value) => validatorMethod(value, context),
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          DefaultFormField(
            textInputAction: TextInputAction.next,
            hintText: S.of(context).age,
            controller: ageController,
            validator: (value) => validatorMethod(value, context),
            textInputType: TextInputType.number,
          ),
          DefaultFormField(
            textInputAction: TextInputAction.next,
            controller: weightController,
            hintText: S.of(context).weight,
            validator: (value) => validatorMethod(value, context),
            textInputType: TextInputType.number,
          ),
          DefaultFormField(
            controller: heightController,
            hintText: S.of(context).height,
            validator: (value) => validatorMethod(value, context),
            textInputType: TextInputType.number,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
          ),
          const SelectGender(),
        ],
      ),
    ),
  );
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is EditableText);
  }
}
