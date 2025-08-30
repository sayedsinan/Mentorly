import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentorly/view/widgets/style/colors.dart';
import 'package:mentorly/view/widgets/zoom_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.linear),
    );

    _progressController.forward();

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.toNamed('/login');
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final containerSize = screenWidth * 0.25;
    final logoSize = containerSize.clamp(80.0, 120.0);
    final titleFontSize = screenWidth * 0.06;
    final subtitleFontSize = screenWidth * 0.045;
    final progressBarWidth = screenWidth * 0.7;
    final loadingTextSize = screenWidth * 0.035;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: logoSize,
                          width: logoSize,
                          decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/brain.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          top: -10,
                          right: -10,
                          child: ZoomPulseContainer(),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.025),

                    Text(
                      'Mentorly',
                      style: TextStyle(
                        fontSize: titleFontSize.clamp(20.0, 32.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Learn Smarter, Grow Faster',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: subtitleFontSize.clamp(16.0, 24.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        height: 10.0,
                        width: progressBarWidth.clamp(200.0, 400.0),
                        child: AnimatedBuilder(
                          animation: _progressAnimation,
                          builder: (context, child) {
                            return LinearProgressIndicator(
                              value: _progressAnimation.value,
                              valueColor: AlwaysStoppedAnimation<Color>(blue),
                              backgroundColor: Colors.blue.shade100,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      'Loading your learning experience...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: loadingTextSize.clamp(14.0, 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
