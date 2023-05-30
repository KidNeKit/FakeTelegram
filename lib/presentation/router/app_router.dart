import 'package:flutter/material.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/search_screen/search_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.getMaterialPageRoute();
      case SearchScreen.routeName:
        return SearchScreen.getMaterialPageRoute();
      default:
        return HomeScreen.getMaterialPageRoute();
    }
  }
}
