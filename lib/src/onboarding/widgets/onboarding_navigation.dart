import 'package:flutter/material.dart';
import 'package:mood_log_app/src/onboarding/controller/onboarding_controller.dart';
import 'package:mood_log_app/src/theme/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: 50.0,
      left: 60.0,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: const ExpandingDotsEffect(
            activeDotColor: foreignBlack, dotHeight: 12),
      ),
    );
  }
}
