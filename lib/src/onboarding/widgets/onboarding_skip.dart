import 'package:flutter/material.dart';
import 'package:mood_log_app/src/onboarding/controller/onboarding_controller.dart';
import 'package:mood_log_app/src/theme/style.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.0,
      right: 20.0,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text(
          'Skip',
          style: TextStyle(
            color: foreignBlack,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}