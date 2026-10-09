import 'package:flutter/material.dart';

class BarbersScreen extends StatelessWidget {
  const BarbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F6),
      appBar: AppBar(
        title: const Text(
          'Our Barbers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E8DC),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.person_search_rounded,
                  size: 48,
                  color: Color(0xFF9A6F48),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Meet Our Barbers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF241B17),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Barber profiles, specialties and availability will appear here.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF81766F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}