import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/auth_service.dart';
import '../utils/locator.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  SigninScreenState createState() => SigninScreenState();
}

class SigninScreenState extends State<SigninScreen> {
  final authService = getIt.get<AuthService>();

  @override
  void initState() {
    super.initState();
    authService.addListener(update);
  }

  void update() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authService.loginWithGoogle().then((value) {
              authService.setLoggedInUser(value!);
              Navigator.pushNamed(context, "/home");
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("icons/google.png", width: 20, height: 20,),
          ),
        )
      ),
    );
  }
}