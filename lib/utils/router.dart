import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/profile/profile_screen.dart';

import '../screens/sign_in_screen.dart';
import '../screens/tabbar/tabbar.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => FRTabbarScreen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
