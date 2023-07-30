import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/auth/login.dart';
import 'package:freshbuyer/screens/detail/detail_screen.dart';
import 'package:freshbuyer/screens/home/home.dart';
import 'package:freshbuyer/screens/mostpopular/most_popular_screen.dart';
import 'package:freshbuyer/screens/special_offers/special_offers_screen.dart';
import 'package:freshbuyer/screens/test/test_screen.dart';
import 'package:freshbuyer/splash.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.route(): (context) => const Splash(),
  LoginScreen.route(): (context) => const LoginScreen(),
  GraphQLWidgetScreen.route(): (context) => const GraphQLWidgetScreen(),
  MostPopularScreen.route(): (context) => const MostPopularScreen(),
  SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  ShopDetailScreen.route(): (context) => const ShopDetailScreen(),
  TestScreen.route(): (context) => const TestScreen(),
};

// import 'package:firebaseapp/homepage.dart';
// import 'package:firebaseapp/signin_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';import 'googlesignin.dart';class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => HomePage());
//       case '/signin':
//         return MaterialPageRoute(builder: (_) => SigninPage());
//       default:
//         return MaterialPageRoute(
//             builder: (_) => Scaffold(
//               body: Center(
//                 child: Text('No route defined for ${settings.name}'),
//               ),
//             ));
//     }
//   }
// }
