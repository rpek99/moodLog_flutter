import 'package:flutter/material.dart';
import 'package:mood_log_app/src/theme/style.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Inbox',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: foreignBlack),
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
                  hintText: 'Search Inbox',
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
                _buildContactTile(
                    'Noah', '2d', 'assets/images/profile_avatar.png'),
                _buildContactTile(
                    'Mia', '17m ago', 'assets/images/profile_avatar.png'),
                _buildContactTile(
                    'James', '1h ago', 'assets/images/profile_avatar.png'),
                _buildContactTile(
                    'Liam', '1h ago', 'assets/images/profile_avatar.png'),
                _buildContactTile('Olivia', 'Active yesterday',
                    'assets/images/profile_avatar.png'),
                _buildContactTile(
                    'Ethan', 'Active now', 'assets/images/profile_avatar.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(String name, String time, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(time, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.chevron_right, color: Color.fromARGB(255, 89, 89, 89), size: 25.0,),
      ),
    );
  }
}
