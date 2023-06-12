import 'package:flutter/material.dart';

import '../../../../resources/styles.dart';

class SettingsTextField extends StatelessWidget {
  final String hintText;
  const SettingsTextField({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: TextField(
        enableSuggestions: false,
        autocorrect: false,
        style: blueHeaderButton.copyWith(color: Colors.black),
        cursorHeight: 22.0,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(0),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: blueHeaderButton.copyWith(
              color: const Color(0xFF3C3C43).withOpacity(0.6)),
        ),
      ),
    );
  }
}
