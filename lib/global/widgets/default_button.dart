import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Object? textBtn;
  final Widget? btn;
  final Color? color;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final double? paddingContent;
  final double? opacity;
  final Color? spColor;
  final ShapeBorder? shapeBorder;

  const DefaultButton({
    super.key,
    this.textBtn,
    this.btn,
    this.color,
    required this.onPressed,
    this.textStyle,
    this.paddingContent,
    this.opacity,
    this.spColor,
    this.shapeBorder,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: spColor,
      shape: shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
      onPressed: onPressed,
      color: color?.withOpacity(opacity ?? .4),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: paddingContent ?? 12.0),
        child: mainBtn(context),
      ),
    );
  }

  Widget mainBtn(context) {
    if (textBtn != null) {
      return Text(
        '$textBtn',
        textAlign: TextAlign.center,
        style: textStyle ??
            Theme.of(context).textTheme.bodySmall,
      );
    } else {
      return btn!;
    }
  }
}
