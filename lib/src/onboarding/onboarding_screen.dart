import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mood_log_app/src/onboarding/controller/onboarding_controller.dart';
import 'package:mood_log_app/src/onboarding/widgets/onboarding_navigation.dart';
import 'package:mood_log_app/src/onboarding/widgets/onboarding_next_button.dart';
import 'package:mood_log_app/src/onboarding/widgets/onboarding_page.dart';
import 'package:mood_log_app/src/onboarding/widgets/onboarding_skip.dart';
import 'package:mood_log_app/src/theme/style.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: 'assets/images/welcome1.jpeg',
                title: 'Welcome to Moodify',
                subTitle:
                    'Moodify is a mood tracking app that helps you understand your emotional patterns, and develop new habits.',
              ),
              OnBoardingPage(
                image: 'assets/images/welcome2.jpeg',
                title: 'Welcome to Moodify',
                subTitle:
                    'Moodify is a mood tracking app that helps you understand your emotional patterns, and develop new habits.',
              ),
              OnBoardingPage(
                image: 'assets/images/welcome3.jpeg',
                title: 'Welcome to Moodify',
                subTitle:
                    'Moodify is a mood tracking app that helps you understand your emotional patterns, and develop new habits.',
              ),
            ],
          ),

          // Skip Button
          const OnBoardingSkip(),

          // Navigation PageIndicator
          const OnBoardingNavigation(),

          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
