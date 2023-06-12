import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class SettingsContainer extends StatelessWidget {
  final List<Widget> children;

  const SettingsContainer({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 13.0, bottom: 13.0, right: 16.0),
          child: children[index],
        ),
        separatorBuilder: (context, index) => Divider(
          height: 1.0,
          color: dividerColor,
        ),
        itemCount: children.length,
      ),
    );
  }
}
