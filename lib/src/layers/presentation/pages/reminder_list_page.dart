import 'package:flutter/material.dart';

class ReminderListPage extends StatefulWidget {
  const ReminderListPage({super.key});

  @override
  State<ReminderListPage> createState() => _ReminderState();
}

class _ReminderState extends State<ReminderListPage> {
  final List<ReminderItem> reminders = [
    const ReminderItem(title: 'Morning', time: '9:30 AM'),
    const ReminderItem(title: 'Afternoon', time: '2:00 PM'),
    const ReminderItem(title: 'Evening', time: '8:30 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 24.0,
          icon: const Icon(Icons.close, color: Colors.black87),
          onPressed: () => {
            // Navigator.of(context).pop()
          },
        ),
        title: const Text('Reminders',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: reminders.length,
                itemBuilder: (context, index) {
                  final reminder = reminders[index];
                  return ReminderItem(
                      title: reminder.title, time: reminder.time);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16), // Add space between items
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 36.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 45,
                    width: 190,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Add reminder logic here
                      },
                      child: const Text(
                        'Add Reminder',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 45,
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        minimumSize: const Size(160, 40),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReminderItem extends StatelessWidget {
  final String title;
  final String time;

  const ReminderItem({super.key, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          Text(time, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
