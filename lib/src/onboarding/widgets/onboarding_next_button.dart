import 'package:flutter/material.dart';
import 'package:mood_log_app/src/onboarding/controller/onboarding_controller.dart';
import 'package:mood_log_app/src/theme/style.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.0,
      left: 210.0,
      child: SizedBox(
        height: 35,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: foreignBlack,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            minimumSize: const Size(160, 40),
            elevation: 0,
          ),
          onPressed: () => OnBoardingController.instance.nextPage(),
          child: const Text(
            'Next',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}