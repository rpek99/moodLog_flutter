import 'package:flutter/material.dart';
import 'package:mood_log_app/src/layers/presentation/pages/add_note_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/profile_page.dart';
import 'package:mood_log_app/src/layers/presentation/pages/reminder_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Epilogue'
      ),
      home: const AddNotePage(),
    );
  }
}