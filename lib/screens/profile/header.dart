import 'package:flutter/material.dart';

import '../../utils/auth_service.dart';
import '../../utils/locator.dart';

class ProfileHeader extends StatelessWidget {
  final authService = getIt<AuthService>();
  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Image.asset('icons/logo-no-background.png', scale: 10, color: Colors.deepPurple,),
              const SizedBox(width: 16),
              const Expanded(
                child: Text('', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              IconButton(
                iconSize: 28,
                icon: Image.asset('assets/icons/tabbar/light/more_circle@2x.png', scale: 2),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(authService.loggedInUser!.photoURL!),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  child: Image.asset('assets/icons/profile/edit_square@2x.png', scale: 2),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(authService.loggedInUser!.displayName!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        const SizedBox(height: 8),
        Text(authService.loggedInUser!.email!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 20),
        Container(
          color: const Color(0xFFEEEEEE),
          height: 1,
          padding: const EdgeInsets.symmetric(horizontal: 24),
        )
      ],
    );
  }
}
