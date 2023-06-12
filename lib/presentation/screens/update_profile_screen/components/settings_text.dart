import 'package:flutter/material.dart';

import '../../../../resources/styles.dart';

class SettingsText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color? color;

  const SettingsText(this.text,
      {this.textAlign = TextAlign.start, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: blueHeaderButton.copyWith(color: color ?? Colors.black),
      textAlign: textAlign,
    );
  }
}
