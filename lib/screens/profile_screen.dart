import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel? user;

  const ProfileScreen({
    super.key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F6),
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const SizedBox(height: 20),

          Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF3E8DC),
                border: Border.all(
                  color: const Color(0xFFC89B6D),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person_rounded,
                      size: 60,
                      color: Color(0xFF9A6F48),
                    );
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          Center(
            child: Text(
              user?.name ?? 'Salon User',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF241B17),
              ),
            ),
          ),

          const SizedBox(height: 6),

          Center(
            child: Text(
              user?.email ?? '',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF81766F),
              ),
            ),
          ),

          const SizedBox(height: 35),

          _ProfileOption(
            icon: Icons.person_outline_rounded,
            title: 'Personal Information',
            subtitle: 'View your account details',
            onTap: () {
              Get.snackbar(
                'Personal Information',
                'Profile editing will be added later.',
              );
            },
          ),

          const SizedBox(height: 12),

          _ProfileOption(
            icon: Icons.notifications_none_rounded,
            title: 'Notifications',
            subtitle: 'Manage notification preferences',
            onTap: () {
              Get.snackbar(
                'Notifications',
                'Notification settings will be added later.',
              );
            },
          ),

          const SizedBox(height: 12),

          _ProfileOption(
            icon: Icons.lock_outline_rounded,
            title: 'Change Password',
            subtitle: 'Update your account password',
            onTap: () {
              Get.snackbar(
                'Change Password',
                'Password settings will be added later.',
              );
            },
          ),

          const SizedBox(height: 12),

          _ProfileOption(
            icon: Icons.help_outline_rounded,
            title: 'Help & Support',
            subtitle: 'Get help using the app',
            onTap: () {
              Get.snackbar(
                'Help & Support',
                'Support features will be added later.',
              );
            },
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 54,
            child: OutlinedButton.icon(
              onPressed: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text('Logout'),
                    content: const Text(
                      'Are you sure you want to log out?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.login);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2A211D),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Logout'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF9A493E),
                side: const BorderSide(
                  color: Color(0xFFE5C9C2),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFECE4DE),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E8DC),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF9A6F48),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF342923),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF81766F),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Color(0xFF9A806C),
              ),
            ],
          ),
        ),
      ),
    );
  }
}