import 'package:fake_telegram/styles.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: dividerColor, width: 0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          height: 36,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(0).copyWith(left: 10.0),
              hintText: 'Поиск по чатам',
              hintStyle: blueHeaderButton.copyWith(
                  color: const Color(0xFF3C3C43).withOpacity(0.6)),
              filled: true,
              fillColor: const Color(0xFF767680).withOpacity(0.12),
            ),
          ),
        ),
      ),
    );
  }
}
