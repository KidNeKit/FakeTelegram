import 'package:flutter/material.dart';

import '../../resources/styles.dart';

class SearchTextField extends StatelessWidget {
  final Function() _onPressedFunc;

  const SearchTextField({required Function() onPressedFunc, super.key})
      : _onPressedFunc = onPressedFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: _onPressedFunc,
        child: SizedBox(
          height: 36,
          child: IgnorePointer(
            child: TextField(
              readOnly: true,
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
      ),
    );
  }
}
