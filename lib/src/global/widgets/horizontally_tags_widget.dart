import 'package:flutter/material.dart';
import 'package:mood_log_app/src/theme/style.dart';

Widget horizontallyTags({
  required List<String> options,
  required Set<String> selectedOptions,
  required Function(String, bool) onSelectionChanged,
  required String title,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: options.map((option) {
            bool isSelected = selectedOptions.contains(option);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (selected) {
                  onSelectionChanged(option, selected);
                },
                selectedColor: Colors.blue.shade100,
                backgroundColor: foreignGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: const BorderSide(
                    color: foreignGrey,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ],
  );
}