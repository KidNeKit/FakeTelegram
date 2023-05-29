import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/navigation_cubit.dart';
import '../contacts_screen/contacts_screen.dart';
import '../messages_screen/messages_screen.dart';
import '../settings_screen/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) => IndexedStack(
          index: state.index,
          children: const [
            ContactsScreen(),
            MessagesScreen(),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}
