import 'package:get/get.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';

  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),

    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
  ];
}