// lib/main.dart

import 'package:fleetflow/screens/accidents_page.dart';
import 'package:fleetflow/screens/analytics_page.dart';
import 'package:fleetflow/screens/drivers_page.dart';
import 'package:fleetflow/screens/live_tracking_page.dart';
import 'package:fleetflow/screens/maintanance_page.dart';
import 'package:fleetflow/screens/notifications_page.dart';
import 'package:fleetflow/screens/parking_page.dart';
import 'package:fleetflow/screens/settings_page.dart';
import 'package:fleetflow/screens/shuttles_page.dart';
import 'package:fleetflow/screens/trips_page.dart';
import 'package:fleetflow/screens/users_page.dart';
import 'package:flutter/material.dart';
import 'package:fleetflow/screens/auth/create_account_screen.dart';
import 'package:fleetflow/screens/auth/sign_in_screen.dart';
import 'package:fleetflow/screens/dashboard/dashboard_screens.dart';
import 'package:fleetflow/screens/splash/splash_screen.dart';
import 'package:fleetflow/screens/vehicle/vehicle_registration_screen.dart';

// Onboarding screens
import 'screens/onboarding_screen1.dart';
import 'screens/onboarding_screen2.dart';
import 'screens/onboarding_screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Custom MaterialColor matching Cleartrack logo blue
  static const MaterialColor cleartrackBlue = MaterialColor(
    0xFF1E9AE0, // Primary blue color from logo
    <int, Color>{
      50: Color(0xFFE3F4FD),
      100: Color(0xFFB9E4FB),
      200: Color(0xFF8BD2F8),
      300: Color(0xFF5CC0F5),
      400: Color(0xFF39B2F3),
      500: Color(0xFF1E9AE0), // Main color
      600: Color(0xFF1A8BCA),
      700: Color(0xFF1578B0),
      800: Color(0xFF116596),
      900: Color(0xFF0A446F),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleartrack Fleet Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: cleartrackBlue,
        primaryColor: const Color(0xFF1E9AE0),
        fontFamily: 'OpenSans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E9AE0),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E9AE0),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF1E9AE0),
          foregroundColor: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xFF1E9AE0),
        ),
      ),

      initialRoute: '/',
      routes: {
        // Splash and onboarding
        '/': (context) => const SplashScreen(),
        '/onboarding1': (context) => const OnboardingScreen1(),
        '/onboarding2': (context) => const OnboardingScreen2(),
        '/onboarding3': (context) => const OnboardingScreen3(),

        // Auth
        '/signin': (context) => const SignInScreen(),
        '/create_account': (context) => const CreateAccountScreen(),
        '/vehicle_registration': (context) => const VehicleRegistrationScreen(),

        // Dashboard
        '/dashboard': (context) => const DashboardScreen(),

        // Fleet management pages
        '/drivers': (context) => const DriversPage(),
        '/users': (context) => const UsersPage(),
        '/accidents': (context) => const AccidentsPage(),
        '/shuttles': (context) => const ShuttlesPage(),
        '/parking': (context) => const ParkingPage(),
        '/trips': (context) => const TripsPage(),
        '/live-tracking': (context) => const LiveTrackingPage(),
        '/maintenance': (context) => const MaintenancePage(),
        '/analytics': (context) => const AnalyticsPage(),
        '/settings': (context) => const SettingsPage(),
        '/notifications': (context) => const NotificationsScreen(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(
                "404 - Page not found",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
