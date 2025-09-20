import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/onboarding1');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Changed to Cleartrack blue background
    const Color backgroundColor = Color(0xFF1E9AE0);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated logo container
              Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/car_logo.jpg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 40,
                                color: const Color(
                                  0xFF1E9AE0,
                                ), // Changed to match background
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'CLEARTRACK',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                    0xFF1E9AE0,
                                  ), // Changed to match background
                                ),
                              ),
                              Text(
                                'Fleet Management',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                  // Scale animation with bounce effect
                  .animate()
                  .scale(
                    duration: 800.ms,
                    curve: Curves.elasticOut,
                    begin: const Offset(0.3, 0.3),
                    end: const Offset(1.0, 1.0),
                  )
                  // Fade in animation
                  .fadeIn(duration: 600.ms, curve: Curves.easeInOut)
                  // Subtle floating animation that repeats
                  .then()
                  .moveY(
                    begin: 0,
                    end: -10,
                    duration: 2000.ms,
                    curve: Curves.easeInOut,
                  )
                  .then()
                  .moveY(
                    begin: -10,
                    end: 0,
                    duration: 2000.ms,
                    curve: Curves.easeInOut,
                  )
                  .animate(onComplete: (controller) => controller.repeat()),

              const SizedBox(height: 40),

              // Animated app name
              const Text(
                    'CLEARTRACK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  )
                  .animate()
                  .fadeIn(
                    delay: 400.ms,
                    duration: 800.ms,
                    curve: Curves.easeInOut,
                  )
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 800.ms,
                    curve: Curves.easeOutCubic,
                  ),

              const SizedBox(height: 12),

              // Animated subtitle
              Text(
                    'Fleet Management System',
                    style: TextStyle(
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                  .animate()
                  .fadeIn(
                    delay: 800.ms,
                    duration: 800.ms,
                    curve: Curves.easeInOut,
                  )
                  .slideY(
                    begin: 0.3,
                    end: 0,
                    duration: 800.ms,
                    curve: Curves.easeOutCubic,
                  ),

              const SizedBox(height: 60),

              // Loading indicator
              SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        // ignore: deprecated_member_use
                        Colors.white.withOpacity(0.8),
                      ),
                      strokeWidth: 3,
                    ),
                  )
                  .animate()
                  .fadeIn(delay: 1200.ms, duration: 600.ms)
                  .scale(
                    delay: 1200.ms,
                    duration: 400.ms,
                    curve: Curves.easeOutBack,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
