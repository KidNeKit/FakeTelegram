import 'presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/cubits/cubit/navigation_cubit.dart';
import 'presentation/screens/home_screen/home_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppRouter appRouter = AppRouter();
  runApp(MyApp(
    appRouter: appRouter,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;

  const MyApp({required AppRouter appRouter, super.key})
      : _appRouter = appRouter;

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
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
