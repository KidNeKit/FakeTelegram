import 'package:flutter/material.dart';

import '../screens/chat_screen/chat_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/search_screen/search_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.getMaterialPageRoute();
      case SearchScreen.routeName:
        return SearchScreen.getMaterialPageRoute();
      case ChatScreen.routeName:
        return ChatScreen.getMaterialPageRoute();
      default:
        return HomeScreen.getMaterialPageRoute();
    }
  }
}
