import 'package:flutter/material.dart';

void main() {
  runApp(const PhotoBoothApp());
}

class PhotoBoothApp extends StatelessWidget {
  const PhotoBoothApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MMIT Photo Booth',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF2E7D0),
        useMaterial3: true,
        fontFamily: 'serif',
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SHENOVA',
                      style: TextStyle(
                        color: Color(0xFF8B6F47),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Vintage camera icon
                    Container(
                      width: 105,
                      height: 75,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B2A24),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: const Color(0xFF8B6F47),
                          width: 3,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFF2E7D0),
                              border: Border.all(
                                color: const Color(0xFF8B6F47),
                                width: 4,
                              ),
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              size: 20,
                              color: Color(0xFF3B2A24),
                            ),
                          ),

                          Positioned(
                            top: 8,
                            right: 10,
                            child: Container(
                              width: 9,
                              height: 9,
                              decoration: const BoxDecoration(
                                color: Color(0xFF8E2F35),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // MMIT
                    const Text(
                      'MMIT',
                      style: TextStyle(
                        color: Color(0xFF3B2A24),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // PHOTO BOOTH
                    const Text(
                      'PHOTO BOOTH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3B2A24),
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Decorative line
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 45,
                          height: 1.5,
                          color: const Color(0xFF8B6F47),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '✦',
                            style: TextStyle(
                              color: Color(0xFF8E2F35),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 1.5,
                          color: const Color(0xFF8B6F47),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      'CAPTURE THE MOMENT',
                      style: TextStyle(
                        color: Color(0xFF6B5145),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Start button
                    SizedBox(
                      width: 230,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: () {
                          // Camera screen will be connected in Milestone 2.
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8E2F35),
                          foregroundColor: const Color(0xFFF8EEDB),
                          elevation: 5,
                          shadowColor: const Color(0x663B2A24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Color(0xFF3B2A24),
                              width: 2,
                            ),
                          ),
                        ),
                        child: const Text(
                          'START',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 34),

                    const Text(
                      'EST. MMIT COLLEGE',
                      style: TextStyle(
                        color: Color(0xFF8B6F47),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Decorative top film strip
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 24,
                color: const Color(0xFF3B2A24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    9,
                    (index) => Container(
                      width: 18,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2E7D0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Decorative bottom film strip
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 24,
                color: const Color(0xFF3B2A24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    9,
                    (index) => Container(
                      width: 18,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2E7D0),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
