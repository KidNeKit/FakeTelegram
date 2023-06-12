import 'package:flutter/material.dart';

import '../screens/chat_screen/chat_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/search_screen/search_screen.dart';
import '../screens/update_profile_screen/update_profile_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return LoginScreen.getMaterialPageRoute();
      case HomeScreen.routeName:
        return HomeScreen.getMaterialPageRoute();
      case SearchScreen.routeName:
        return SearchScreen.getMaterialPageRoute();
      case ChatScreen.routeName:
        return ChatScreen.getMaterialPageRoute();
      case UpdateProfileScreen.routeName:
        return UpdateProfileScreen.getMaterialPageRoute();
      default:
        return HomeScreen.getMaterialPageRoute();
    }
  }
}
