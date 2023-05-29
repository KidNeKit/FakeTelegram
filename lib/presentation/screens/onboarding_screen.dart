import 'package:fake_telegram/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Введите Ваше имя'),
          TextField(),
          ElevatedButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, HomeScreen.routeName),
            child: Text('Далее'),
          ),
        ],
      ),
    );
  }
}
