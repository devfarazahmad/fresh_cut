import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel? user = Get.arguments as UserModel?;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F6),
      appBar: AppBar(
        title: const Text(
          'Salon Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Logout',
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
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A211D),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'WELCOME BACK',
                      style: TextStyle(
                        color: Color(0xFFC89B6D),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      user?.name ?? 'Salon User',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      user?.email ?? '',
                      style: const TextStyle(
                        color: Color(0xFFD5C9C1),
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Row(
                      children: [
                        Icon(
                          Icons.content_cut_rounded,
                          color: Color(0xFFC89B6D),
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Your salon, managed smarter.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                "Today's Overview",
                style: TextStyle(
                  color: Color(0xFF241B17),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Dummy statistics
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.35,
                children: const [
                  _StatCard(
                    title: 'Appointments',
                    value: '12',
                    icon: Icons.calendar_month_rounded,
                    color: Color(0xFFB47B4D),
                  ),
                  _StatCard(
                    title: 'Customers',
                    value: '08',
                    icon: Icons.people_alt_outlined,
                    color: Color(0xFF64866A),
                  ),
                  _StatCard(
                    title: 'Services',
                    value: '06',
                    icon: Icons.content_cut_rounded,
                    color: Color(0xFF7D78A8),
                  ),
                  _StatCard(
                    title: 'Revenue',
                    value: 'Rs. 8,500',
                    icon: Icons.payments_outlined,
                    color: Color(0xFFB68A42),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'Quick Actions',
                style: TextStyle(
                  color: Color(0xFF241B17),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              const _ActionCard(
                title: 'Manage Appointments',
                subtitle: 'View and organize bookings',
                icon: Icons.calendar_month_rounded,
              ),

              const SizedBox(height: 12),

              const _ActionCard(
                title: 'Manage Customers',
                subtitle: 'View your salon customers',
                icon: Icons.people_alt_outlined,
              ),

              const SizedBox(height: 12),

              const _ActionCard(
                title: 'Manage Services',
                subtitle: 'Haircuts, styling and other services',
                icon: Icons.content_cut_rounded,
              ),

              const SizedBox(height: 12),

              const _ActionCard(
                title: 'Manage Payments',
                subtitle: 'Review salon income and payments',
                icon: Icons.account_balance_wallet_outlined,
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  'Salon Management • Demo Dashboard',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.brown.shade300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFECE4DE),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: color,
            size: 27,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF241B17),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF81766F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFECE4DE),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF3E8DC),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF9A6F48),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
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
            size: 16,
            color: Color(0xFF9A806C),
          ),
        ],
      ),
    );
  }
}