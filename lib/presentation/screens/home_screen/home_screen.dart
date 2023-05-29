import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../colors.dart';
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
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  final List<Map<String, dynamic>> _navIcons = const [
    {'icon': Icons.contact_mail, 'text': 'Контакты'},
    {'icon': Icons.chat, 'text': 'Чаты'},
    {'icon': Icons.settings, 'text': 'Настройки'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) => Container(
        height: 49,
        decoration: BoxDecoration(
          color: navBarColor,
          border: Border(top: BorderSide(width: 0.5, color: dividerColor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _navIcons.length,
            (index) => NavIcon(
              index: index,
              iconData: _navIcons[index]['icon'],
              text: _navIcons[index]['text'],
              isSelected: index == state.index,
            ),
          ),
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  final int _index;
  final IconData _icon;
  final String _text;
  final bool _isSelected;

  const NavIcon(
      {required int index,
      required IconData iconData,
      required String text,
      bool isSelected = false,
      super.key})
      : _index = index,
        _icon = iconData,
        _text = text,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    Color color = _isSelected ? blueSelectedColor : greyDisabledColor;
    return GestureDetector(
      onTap: () => context.read<NavigationCubit>().changeScreen(_index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, color: color, size: 25.0),
          Text(_text,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: color)),
        ],
      ),
    );
  }
}
