import 'package:flutter/material.dart';
import 'package:mood_log_app/src/theme/style.dart';

class NotificationListPage extends StatelessWidget {
  const NotificationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    hintText: 'Search notifications',
                    hintStyle: const TextStyle(fontSize: 16.0),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: foreignGrey,
                  ),
                ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMessageTile(
                    Icons.nightlight_round, 'Sleep well tonight', '5m ago'),
                _buildMessageTile(Icons.chat_bubble_outline,
                    'How are you feeling?', '30m ago'),
                _buildMessageTile(Icons.show_chart,
                    'Your mood has been down for...', '1h ago'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: foreignBlack,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mood), label: 'Mood'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildMessageTile(IconData icon, String title, String time) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: foreignGrey,
        child: Icon(icon, color: Colors.black54),
      ),
      title: Text(title),
      subtitle: Text(time),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
