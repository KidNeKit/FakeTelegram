import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubit/navigation_cubit.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/onboarding_screen.dart';
import 'themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const OnboardingScreen(),
        theme: themeData,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
