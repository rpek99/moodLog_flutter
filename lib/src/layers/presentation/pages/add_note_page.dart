import 'package:flutter/material.dart';
import 'package:mood_log_app/src/global/widgets/horizontally_tags_widget.dart';
import 'package:mood_log_app/src/theme/style.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  List<String> events = [
    'Birthday',
    'Date',
    'Work',
    'Family',
    'Trip',
  ];

  List<String> emotions = [
    'Happy',
    'Sad',
    'Angry',
    'Embarrassed',
    'Anxious',
  ];

  Set<String> selectedEvents = {};
  Set<String> selectedEmotions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add a note',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: foreignBlack,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: foreignBlue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'What happened today?',
                filled: true,
                fillColor: foreignGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'How did you feel?',
                  filled: true,
                  fillColor: foreignGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLines: 2,
              ),
            ),
            horizontallyTags(
              options: events,
              selectedOptions: selectedEvents,
              onSelectionChanged: (option, selected) {
                setState(() {
                  if (selected) {
                    selectedEvents.add(option);
                  } else {
                    selectedEvents.remove(option);
                  }
                });
              },
              title: "Tag Event",
            ),
            horizontallyTags(
              options: emotions,
              selectedOptions: selectedEmotions,
              onSelectionChanged: (option, selected) {
                setState(() {
                  if (selected) {
                    selectedEmotions.add(option);
                  } else {
                    selectedEmotions.remove(option);
                  }
                });
              },
              title: "Tag Emotion",
            ),
          ],
        ),
      ),
    );
  }
}


