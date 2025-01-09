import 'package:flutter/material.dart';

extension TextWidgetExtension on Text {
  Size getSize({double width = double.infinity, required BuildContext context}) {
    final textPainter = TextPainter(
      text: TextSpan(text: data, style: DefaultTextStyle.of(context).style.merge(style)),
      maxLines: maxLines,
      strutStyle: strutStyle,
      textDirection: textDirection ?? TextDirection.ltr,
      textHeightBehavior: textHeightBehavior,
    )..layout(minWidth: 0, maxWidth: width);

    return textPainter.size;
  }
}
