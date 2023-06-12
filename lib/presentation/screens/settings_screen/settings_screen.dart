import 'package:flutter/material.dart';

import 'components/settings_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 10.0, bottom: 20.0),
        child: Column(
          children: const [
            SettingsHeader(),
          ],
        ),
      ),
    );
  }
}
