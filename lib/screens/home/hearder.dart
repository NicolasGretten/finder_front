import 'package:flutter/material.dart';
import 'package:freshbuyer/constants.dart';
import 'package:freshbuyer/screens/profile/profile_screen.dart';

import '../../utils/auth_service.dart';
import '../../utils/locator.dart';
import '../../utils/navigation_service.dart';

class HomeAppBar extends StatelessWidget {
  final authService = getIt<AuthService>();
  final navigationService = getIt<NavigationService>();
  HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            onTap: () => navigationService.navigateTo('/profile'),
            child: CircleAvatar(
              backgroundImage: NetworkImage(authService.loggedInUser!.photoURL!),
              radius: 24,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bienvenue',
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    authService.loggedInUser!.displayName!,
                    style: const TextStyle(
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            iconSize: 28,
            icon: Image.asset('$kIconPath/notification.png'),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          IconButton(
            iconSize: 28,
            icon: Image.asset('$kIconPath/light/heart@2x.png'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
