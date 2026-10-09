import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SalonApp());
}

class SalonApp extends StatelessWidget {
  const SalonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salon Management',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF8F6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC89B6D),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFAF8F6),
          foregroundColor: Color(0xFF241B17),
          elevation: 0,
          centerTitle: false,
        ),
      ),

      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.pages,
    );
  }
}