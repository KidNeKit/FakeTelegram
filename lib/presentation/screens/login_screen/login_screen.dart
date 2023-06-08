import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di_container.dart';
import '../../../domain/repositories/base_user_repository.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/chats/chats_bloc.dart';
import '../../cubits/login/login_cubit.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user != null) {
          context.read<ChatsBloc>().add(ChatsUpdated(state.user!.userId!));
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Spacer(),
            TextField(
                onChanged: (value) =>
                    locator.get<LoginCubit>().changeEmail(value)),
            TextField(
                onChanged: (value) =>
                    locator.get<LoginCubit>().changePassword(value)),
            ElevatedButton(
              onPressed: () =>
                  context.read<LoginCubit>().signInWithEmailAndPassword(),
              child: const Text('Login'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  static Route getMaterialPageRoute() => MaterialPageRoute(
      builder: (_) => BlocProvider(
            create: (context) => LoginCubit(locator.get<BaseUserRepository>()),
            child: const LoginScreen(),
          ));
}
