import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/image1.jpg',
      'assets/image2.jpg',
      'assets/image3.jpg',
      'assets/image4.jpg',
      'assets/image5.jpg',
      'assets/image6.jpg',
      'assets/image7.jpg',
      'assets/image8.jpg',
      'assets/image9.jpg',
      'assets/image10.jpg',
      'assets/image11.jpg',
      'assets/image12.jpg',
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Animated Background Image Grid
          GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: imagePaths.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemBuilder: (context, index) {
              final path = imagePaths[index];
              try {
                return Image.asset(path, fit: BoxFit.cover)
                    .animate()
                    .fadeIn(
                      delay: Duration(milliseconds: index * 100),
                      duration: 800.ms,
                      curve: Curves.easeInOut,
                    )
                    .scale(
                      delay: Duration(milliseconds: index * 100),
                      duration: 800.ms,
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.0, 1.0),
                      curve: Curves.easeOutBack,
                    );
              } catch (e) {
                return Container(color: Colors.grey[300]).animate().fadeIn(
                  delay: Duration(milliseconds: index * 100),
                  duration: 800.ms,
                );
              }
            },
          ),

          // Animated overlay with gradient effect
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.1),
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.3),
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
          ).animate().fadeIn(
            delay: 500.ms,
            duration: 1000.ms,
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
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: const Offset(0, -5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Animated page indicators
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildDot(active: true, delay: 1000),
                              const SizedBox(width: 4),
                              _buildDot(delay: 1100),
                              const SizedBox(width: 4),
                              _buildDot(delay: 1200),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Animated title
                          const Text(
                                'Welcome to FleetFlow',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                              .animate()
                              .fadeIn(
                                delay: 1300.ms,
                                duration: 800.ms,
                                curve: Curves.easeInOut,
                              )
                              .slideX(
                                begin: -0.3,
                                end: 0,
                                duration: 800.ms,
                                curve: Curves.easeOutCubic,
                              ),

                          const SizedBox(height: 10),

                          // Animated description
                          Text(
                                'Embark on a seamless journey with FleetFlow, your trusted partner in car management.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              )
                              .animate()
                              .fadeIn(
                                delay: 1500.ms,
                                duration: 800.ms,
                                curve: Curves.easeInOut,
                              )
                              .slideX(
                                begin: -0.2,
                                end: 0,
                                duration: 800.ms,
                                curve: Curves.easeOutCubic,
                              ),

                          const SizedBox(height: 20),

                          // Animated buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signin');
                                    },
                                    child: const Text(
                                      'Skip',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  )
                                  .animate()
                                  .fadeIn(delay: 1700.ms, duration: 600.ms)
                                  .slideY(
                                    begin: 0.3,
                                    end: 0,
                                    duration: 600.ms,
                                    curve: Curves.easeOutBack,
                                  ),

                              ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/onboarding2',
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 15,
                                      ),
                                      elevation: 5,
                                    ),
                                    child: const Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )
                                  .animate()
                                  .fadeIn(delay: 1900.ms, duration: 600.ms)
                                  .slideY(
                                    begin: 0.3,
                                    end: 0,
                                    duration: 600.ms,
                                    curve: Curves.easeOutBack,
                                  )
                                  .shimmer(
                                    delay: 2500.ms,
                                    duration: 1500.ms,
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.3),
                                  ),
                            ],
                          ),
                        ],
                      ),
                    )
                    .animate()
                    .slideY(
                      begin: 1.0,
                      end: 0,
                      duration: 1000.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .fadeIn(duration: 800.ms, curve: Curves.easeInOut),
          ),
        ],
      ),
    );
  }

  // Enhanced animated dot helper
  Widget _buildDot({bool active = false, int delay = 0}) {
    return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? Colors.blue : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: delay),
          duration: 400.ms,
        )
        .scale(
          delay: Duration(milliseconds: delay),
          duration: 400.ms,
          begin: const Offset(0.5, 0.5),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeOutBack,
        )
        .then()
        .shimmer(
          delay: Duration(milliseconds: active ? 1000 : 0),
          duration: active ? 1000.ms : 0.ms,
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.5),
        );
  }
}
