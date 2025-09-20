import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Animated background image with zoom effect (unchanged)
          Image.asset(
                'assets/blue_car.jpg', // Keeping the original purple car image
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color.fromRGBO(
                      33,
                      150,
                      243,
                      0.3,
                    ), // Changed to blue
                    child: const Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
              .animate()
              .fadeIn(duration: 1000.ms, curve: Curves.easeInOut)
              .scale(
                duration: 8000.ms,
                begin: const Offset(1.0, 1.0),
                end: const Offset(1.1, 1.1),
                curve: Curves.easeInOut,
              ),

          // Enhanced animated overlay with more sophisticated gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.2),
                  Colors.black.withValues(alpha: 0.4),
                ],
                stops: const [0.0, 0.4, 0.7, 1.0],
              ),
            ),
          ).animate().fadeIn(
            delay: 300.ms,
            duration: 1500.ms,
            curve: Curves.easeInOut,
          ),

          // Animated bottom content container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
                Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 30,
                            spreadRadius: 8,
                            offset: const Offset(0, -10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Animated page indicators with special finale effects
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildDot(active: false, delay: 800, index: 0),
                              const SizedBox(width: 4),
                              _buildDot(active: false, delay: 900, index: 1),
                              const SizedBox(width: 4),
                              _buildDot(active: true, delay: 1000, index: 2),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Animated title with special effects for final screen
                          const Text(
                                'Performance Metrics',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                              .animate()
                              .fadeIn(
                                delay: 1200.ms,
                                duration: 800.ms,
                                curve: Curves.easeInOut,
                              )
                              .slideX(
                                begin: -0.3,
                                end: 0,
                                duration: 800.ms,
                                curve: Curves.easeOutCubic,
                              )
                              .then()
                              .shimmer(
                                delay: 400.ms,
                                duration: 1500.ms,
                                color: const Color.fromRGBO(
                                  33,
                                  150,
                                  243,
                                  0.4,
                                ), // Changed to blue
                              ),

                          const SizedBox(height: 10),

                          // Animated description with typewriter-like effect
                          Text(
                                'Dive into the performance metrics of each vehicle in your fleet. Access comprehensive data that empowers you to make informed decisions.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              )
                              .animate()
                              .fadeIn(
                                delay: 1400.ms,
                                duration: 1000.ms,
                                curve: Curves.easeInOut,
                              )
                              .slideX(
                                begin: -0.2,
                                end: 0,
                                duration: 1000.ms,
                                curve: Curves.easeOutCubic,
                              ),

                          const SizedBox(height: 20),

                          // Enhanced "Get Started" button with finale animations
                          SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signin');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(
                                      33,
                                      150,
                                      243,
                                      1.0,
                                    ), // Changed to blue
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 18,
                                    ),
                                    elevation: 10,
                                  ),
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                              .animate()
                              .fadeIn(delay: 1800.ms, duration: 800.ms)
                              .slideY(
                                begin: 0.5,
                                end: 0,
                                duration: 800.ms,
                                curve: Curves.easeOutBack,
                              )
                              .then()
                              .shimmer(
                                delay: 500.ms,
                                duration: 2000.ms,
                                color: Colors.white.withValues(alpha: 0.5),
                              )
                              .then()
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                              )
                              .scale(
                                duration: 1500.ms,
                                begin: const Offset(1.0, 1.0),
                                end: const Offset(1.02, 1.02),
                                curve: Curves.easeInOut,
                              )
                              .then()
                              .scale(
                                duration: 1500.ms,
                                begin: const Offset(1.02, 1.02),
                                end: const Offset(1.0, 1.0),
                                curve: Curves.easeInOut,
                              )
                              .then()
                              .shimmer(
                                duration: 1000.ms,
                                color: Colors.white.withValues(alpha: 0.3),
                              ),
                        ],
                      ),
                    )
                    .animate()
                    .slideY(
                      begin: 1.0,
                      end: 0,
                      duration: 1200.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .fadeIn(duration: 1000.ms, curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }

  // Enhanced animated dot helper with sophisticated effects
  Widget _buildDot({bool active = false, int delay = 0, int index = 0}) {
    return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: active
                ? const Color.fromRGBO(33, 150, 243, 1.0) // Changed to blue
                : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: delay),
          duration: 500.ms,
        )
        .scale(
          delay: Duration(milliseconds: delay),
          duration: 500.ms,
          begin: const Offset(0.2, 0.2),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeOutBack,
        )
        .then()
        .shimmer(
          delay: Duration(milliseconds: active ? 600 : 0),
          duration: active ? 1500.ms : 0.ms,
          color: Colors.white.withValues(alpha: 0.8),
        )
        .then(delay: Duration(milliseconds: active ? 1000 : 0))
        .animate(onPlay: active ? (controller) => controller.repeat() : null)
        .scale(
          duration: active ? 1200.ms : 0.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.4, 1.4),
          curve: Curves.easeInOut,
        )
        .then()
        .scale(
          duration: active ? 1200.ms : 0.ms,
          begin: const Offset(1.4, 1.4),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeInOut,
        )
        .then()
        .shimmer(
          duration: active ? 800.ms : 0.ms,
          color: const Color.fromRGBO(33, 150, 243, 0.6), // Changed to blue
        );
  }
}
