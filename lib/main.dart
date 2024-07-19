import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mood_log_app/src/layers/presentation/pages/add_note_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/inbox_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/login_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/mood_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/notification_list_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/profile_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/reminder_list_page.dart';
import 'package:mood_log_app/src/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Epilogue'
      ),
      home: const OnboardingScreen(),
    );
  }
}
