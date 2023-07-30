import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/home_screen.dart';
import 'package:freshbuyer/screens/sign_in_screen.dart';
import 'package:freshbuyer/screens/tabbar/tabbar.dart';
import 'package:freshbuyer/utils/auth_service.dart';
import 'package:freshbuyer/utils/locator.dart';
import 'package:freshbuyer/utils/navigation_service.dart';
import 'package:freshbuyer/utils/router.dart';

Future<void> main() async {
  print("MAIN");
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAdraWQyHuvXRDq-nUdy3DyowLCNwHfyPo",
      appId: "113921656321",
      messagingSenderId: "113921656321 ",
      projectId: "finder-56f03",
    ));
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final authService = getIt.get<AuthService>();
//
//     return FutureBuilder(
//       // Initialize FlutterFire
//       future: Firebase.initializeApp(
//         options: const FirebaseOptions(
//           apiKey: "AIzaSyAdraWQyHuvXRDq-nUdy3DyowLCNwHfyPo",
//           appId: "113921656321",
//           messagingSenderId: "113921656321 ",
//           projectId: "finder-56f03",
//       ),),
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           if (kDebugMode) {
//             print(Text(snapshot.error.toString()));
//           }
//         }
//
//         // Once complete, show your application
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Auth App',
//             theme: ThemeData(
//               primarySwatch: Colors.deepPurple,
//             ),
//             home: HomeScreen(),
//             initialRoute: authService.isLoggedIn ? '/' : '/signin',
//             navigatorKey: getIt<NavigationService>().navigatorKey,
//             onGenerateRoute: AppRouter.generateRoute,
//           );
//         }
//
//         // Otherwise, show something whilst waiting for initialization to complete
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  final authService = getIt.get<AuthService>();
  MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FINDER',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AuthenticationWrapper(),
      navigatorKey: getIt<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  final authService = getIt<AuthService>();
  final navigationService = getIt<NavigationService>();
  AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            authService.setLoggedInUser(snapshot.data!);
            return FRTabbarScreen();
          } else {
            return const SigninScreen();
          }
        }
      },
    );
  }
}