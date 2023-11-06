import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final TextStyle? style;
  final String text;
  const TextWidget({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
      style: style,
    );
  }
}
