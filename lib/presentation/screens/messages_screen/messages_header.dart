import 'package:flutter/material.dart';

import '../../../resources/styles.dart';

class MessagesHeader extends StatelessWidget {
  const MessagesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 10.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Изм.', style: blueHeaderButton),
            Text('Чаты', style: headerLabel),
            Text('ssss', style: blueHeaderButton),
          ],
        ),
      ),
    );
  }
}
