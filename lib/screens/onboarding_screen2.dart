import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/image13.jpg',
      'assets/image14.jpg',
      'assets/image15.jpg',
      'assets/image16.jpg',
      'assets/image17.jpg',
      'assets/image18.jpg',
      'assets/image19.jpg',
      'assets/image20.jpg',
      'assets/image21.jpg',
      'assets/image22.jpg',
      'assets/image23.jpg',
      'assets/image24.jpg',
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
              try {
                return Image.asset(imagePaths[index], fit: BoxFit.cover)
                    .animate()
                    .fadeIn(
                      delay: Duration(milliseconds: index * 80),
                      duration: 700.ms,
                      curve: Curves.easeInOut,
                    )
                    .scale(
                      delay: Duration(milliseconds: index * 80),
                      duration: 700.ms,
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1.0, 1.0),
                      curve: Curves.easeOutCubic,
                    )
                    .then()
                    .shimmer(
                      delay: Duration(milliseconds: 1000 + (index * 50)),
                      duration: 800.ms,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.1),
                    );
              } catch (e) {
                return Container(color: Colors.grey[300]).animate().fadeIn(
                  delay: Duration(milliseconds: index * 80),
                  duration: 700.ms,
                );
              }
            },
          ),

          // Enhanced animated overlay with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.1),
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.25),
                  // ignore: deprecated_member_use
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ).animate().fadeIn(
            delay: 400.ms,
            duration: 1200.ms,
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
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 25,
                            spreadRadius: 5,
                            offset: const Offset(0, -8),
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
                              _buildDot(active: false, delay: 1000),
                              const SizedBox(width: 4),
                              _buildDot(active: true, delay: 1100),
                              const SizedBox(width: 4),
                              _buildDot(active: false, delay: 1200),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Animated title with typing effect
                          const Text(
                                'Manage Your Fleet Seamlessly',
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
                                begin: 0.3,
                                end: 0,
                                duration: 800.ms,
                                curve: Curves.easeOutCubic,
                              )
                              .then()
                              .shimmer(
                                delay: 500.ms,
                                duration: 1200.ms,
                                // ignore: deprecated_member_use
                                color: Colors.blue.withOpacity(0.3),
                              ),

                          const SizedBox(height: 10),

                          // Animated description with wave effect
                          Text(
                                'Track, maintain, and optimize all your vehicles with intuitive tools and real-time insights.',
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
                                begin: 0.2,
                                end: 0,
                                duration: 800.ms,
                                curve: Curves.easeOutCubic,
                              ),

                          const SizedBox(height: 20),

                          // Animated buttons with enhanced effects
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
                                    begin: 0.4,
                                    end: 0,
                                    duration: 600.ms,
                                    curve: Curves.easeOutBack,
                                  )
                                  .then()
                                  .shake(
                                    delay: 3000.ms,
                                    duration: 400.ms,
                                    hz: 2,
                                  ),

                              ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        '/onboarding3',
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
                                      elevation: 8,
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
                                    begin: 0.4,
                                    end: 0,
                                    duration: 600.ms,
                                    curve: Curves.easeOutBack,
                                  )
                                  .then()
                                  .shimmer(
                                    delay: 1000.ms,
                                    duration: 1500.ms,
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.4),
                                  )
                                  .then()
                                  .animate(
                                    onPlay: (controller) => controller.repeat(),
                                  )
                                  .scale(
                                    duration: 2000.ms,
                                    begin: const Offset(1.0, 1.0),
                                    end: const Offset(1.05, 1.05),
                                    curve: Curves.easeInOut,
                                  )
                                  .then()
                                  .scale(
                                    duration: 2000.ms,
                                    begin: const Offset(1.05, 1.05),
                                    end: const Offset(1.0, 1.0),
                                    curve: Curves.easeInOut,
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

  // Enhanced animated dot helper with pulsing effect
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
          begin: const Offset(0.3, 0.3),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeOutBack,
        )
        .then()
        .shimmer(
          delay: Duration(milliseconds: active ? 800 : 0),
          duration: active ? 1200.ms : 0.ms,
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.6),
        )
        .then(delay: Duration(milliseconds: active ? 2000 : 0))
        .animate(onPlay: active ? (controller) => controller.repeat() : null)
        .scale(
          duration: active ? 1500.ms : 0.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.3, 1.3),
          curve: Curves.easeInOut,
        )
        .then()
        .scale(
          duration: active ? 1500.ms : 0.ms,
          begin: const Offset(1.3, 1.3),
          end: const Offset(1.0, 1.0),
          curve: Curves.easeInOut,
        );
  }
}
