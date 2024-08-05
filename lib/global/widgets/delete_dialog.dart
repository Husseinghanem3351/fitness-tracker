import 'package:flutter/material.dart';
import 'default_button.dart';

void deleteDialog({required context,required String message,required void Function()? onPressed}){
  showDialog(context: context, builder: (context) => AlertDialog(
    content: Text(message),
    actions: [
      DefaultButton(
        onPressed: onPressed,
        textBtn: 'confirm',
      ),
      DefaultButton(
        onPressed: (){
          Navigator.of(context).pop(false);
        },
        textBtn: 'cancel',
      )
    ],
  ),);
}