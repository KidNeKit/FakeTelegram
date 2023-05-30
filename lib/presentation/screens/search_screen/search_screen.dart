import 'dart:developer';

import 'package:fake_telegram/colors.dart';
import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../global_components/search_text_field.dart';
import 'search_criteria.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: navBarColor,
            border: Border(bottom: BorderSide(color: dividerColor, width: 0.5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                    child: SearchTextField(onPressedFunc: () {
                      log('kekekekek');
                    }),
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Отмена',
                        style: blueHeaderButton,
                      )),
                ],
              ),
              const SearchCriteria(),
            ],
          ),
        ),
      ),
    );
  }
}
