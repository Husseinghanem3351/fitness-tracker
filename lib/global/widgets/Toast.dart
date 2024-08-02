
import 'package:flutter/material.dart';

void showToast({
  required context,
  required String msg,
  Color color = Colors.white,
}) {
  const TextStyle textStyle = TextStyle(fontSize: 30, color: Colors.black);
  double textWidth =
      _textSize(msg, textStyle, MediaQuery.of(context).size.width).width;
  final SnackBar snackBarConst = SnackBar(
    width: textWidth,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    content: Text(
      msg,
      textAlign: TextAlign.center,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 15,
      ),
    ),
    duration: const Duration(
      seconds: 5,
    ),
    backgroundColor: color,
  );
  WidgetsBinding.instance.addPostFrameCallback((_) =>ScaffoldMessenger.of(context).showSnackBar(snackBarConst));

}

Size _textSize(String text, TextStyle style, double maxWidth) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center,
  )..layout(minWidth: 70, maxWidth: maxWidth * 0.75);
  return textPainter.size;
}