import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di_container.dart';
import 'presentation/blocs/active_chat/active_chat_bloc.dart';
import 'presentation/cubits/cubit/navigation_cubit.dart';
import 'presentation/router/app_router.dart';
import 'presentation/screens/home_screen/home_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'resources/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => ActiveChatBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const OnboardingScreen(),
        theme: themeData,
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: locator.get<AppRouter>().onGenerateRoute,
      ),
    );
  }
}
