import 'package:flutter/material.dart';

import '../utils/auth_service.dart';
import '../utils/locator.dart';

class HomeScreen extends StatelessWidget {
  final authService = getIt<AuthService>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: authService.isLoggedIn
            ? Column(
                children: [
                  Image.network(authService.loggedInUser!.photoURL!),
                  Text(authService.loggedInUser!.displayName!),
                  Text(authService.loggedInUser!.email!),
                  TextButton(
                      onPressed: () {
                        authService.loginOutWithGoogle();
                      },
                      child: const Text("Logout"))
                ],
              )
            : const Text("Not Logged In"));
  }
}
