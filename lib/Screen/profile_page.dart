import 'package:flutter/material.dart';

import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final username = email.split('@').first;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              const SizedBox(height: 28),
              CircleAvatar(
                radius: 48,
                backgroundColor: const Color(0xFFD8E9E2),
                child: Text(
                  username.isEmpty ? '?' : username[0].toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFF087E70),
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                username,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF18312E),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(email, style: const TextStyle(color: Color(0xFF74817D))),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      color: Color(0xFF087E70),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Akun EventPass',
                        style: TextStyle(
                          color: Color(0xFF203431),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Color(0xFF87938E)),
                  ],
                ),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () => Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(builder: (_) => const LoginPage()),
                  (_) => false,
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFB33F3F),
                  minimumSize: const Size.fromHeight(52),
                  side: const BorderSide(color: Color(0xFFE8CACA)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
