import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import 'home_screen.dart';
import 'booking_screen.dart';
import 'barbers_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {
  int currentIndex = 0;

  late final UserModel? user;

  @override
  void initState() {
    super.initState();
    user = Get.arguments as UserModel?;
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(user: user),
      const BookingScreen(),
      const BarbersScreen(),
      ProfileScreen(user: user),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFECE4DE),
            ),
          ),
        ),
        child: SafeArea(
          top: false,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF9A6F48),
            unselectedItemColor: const Color(0xFF9A9089),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            showUnselectedLabels: true,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                activeIcon: Icon(Icons.calendar_month_rounded),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.content_cut_outlined),
                activeIcon: Icon(Icons.content_cut_rounded),
                label: 'Barbers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                activeIcon: Icon(Icons.person_rounded),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}