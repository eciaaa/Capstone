import 'package:flutter/material.dart';
import '../utils/theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Fire Alert',
        'message': 'Fire reported in Zone 5. Evacuate Immediately!',
        'date': '2025/05/20',
      },
      {
        'title': 'Fire Alert',
        'message': 'Fire reported in Zone 5. Evacuate Immediately!',
        'date': '2025/05/20',
      },
      {
        'title': 'Fire Alert',
        'message': 'Fire reported in Zone 5. Evacuate Immediately!',
        'date': '2025/05/20',
      },
      {
        'title': 'Fire Alert',
        'message': 'Fire reported in Zone 5. Evacuate Immediately!',
        'date': '2025/05/20',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientStart,
        elevation: 0,
        automaticallyImplyLeading: false,
        // Removed title (logo PNG)
      ),
      body: Container(
        color: Colors.white,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final notif = notifications[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning, color: Colors.red, size: 36),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notif['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notif['message']!,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Channel: SMS • ${notif['date']}',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
} 