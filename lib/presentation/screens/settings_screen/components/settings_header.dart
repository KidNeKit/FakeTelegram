import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/styles.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.qr_code),
            Text('Изм.', style: blueHeaderButton),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              CircleAvatar(
                backgroundColor: Colors.amber,
                radius: size.width / 8,
              ),
              const SizedBox(height: 10.0),
              Text('Name', style: settingsShownName),
              const SizedBox(height: 3.0),
              Text(
                '+375 xx xxx xx xx * @KidNeKit',
                style: blueHeaderButton.copyWith(color: greyInfoColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
