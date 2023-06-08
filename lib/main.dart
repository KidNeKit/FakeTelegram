import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di_container.dart';
import 'presentation/blocs/active_chat/active_chat_bloc.dart';
import 'presentation/blocs/auth/auth_bloc.dart';
import 'presentation/blocs/chats/chats_bloc.dart';
import 'presentation/cubits/navigation/navigation_cubit.dart';
import 'presentation/router/app_router.dart';
import 'presentation/screens/login_screen/login_screen.dart';
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
        BlocProvider(create: (_) => ActiveChatBloc(locator.call())),
        BlocProvider(
          create: (_) => AuthBloc(locator.call()),
          lazy: false,
        ),
        BlocProvider(
            create: (_) =>
                ChatsBloc(locator.call(), locator.call())..add(ChatsUpdated()),
            lazy: false),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const OnboardingScreen(),
        theme: themeData,
        initialRoute: LoginScreen.routeName,
        onGenerateRoute: locator.get<AppRouter>().onGenerateRoute,
      ),
    );
  }
}
