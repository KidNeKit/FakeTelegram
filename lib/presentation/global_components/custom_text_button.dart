import 'package:flutter/material.dart';

import '../../resources/styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustomTextButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text, style: blueHeaderButton),
    );
  }
}
