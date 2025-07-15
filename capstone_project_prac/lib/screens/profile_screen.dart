import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../utils/mock_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userType = MockAuth.currentUserType;
    final String name = userType == UserType.volunteer ? 'Joshua Louis Bernales' : 'Eriscia Mae Perez';
    final String status = 'Active';
    final List<Map<String, String>> tasks = [
      {
        'title': 'Medical Assistance',
        'location': 'Zone 4, Malabon',
        'urgency': '4',
        'assignedBy': 'Brgy. Captain Reyes',
        'status': 'Assigned',
      },
      {
        'title': 'Supply Delivery',
        'location': 'Zone 2, Valenzuela',
        'urgency': '3',
        'assignedBy': 'Brgy. Officer Santos',
        'status': 'Pending',
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
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [gradientStart, gradientEnd],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 56, color: gradientEnd),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.directions_run, color: Colors.green, size: 18),
                    const SizedBox(width: 6),
                    Text('Activity Status', style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500)),
                    const SizedBox(width: 8),
                    const Icon(Icons.circle, color: Colors.green, size: 12),
                    Text(' $status', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: const Text('Personal Details'),
                        onTap: () {},
                      ),
                      if (userType == UserType.volunteer) ...[
                        const SizedBox(height: 8),
                        const Text('My Task', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 8),
                        ...tasks.map((task) => Container(
                              margin: const EdgeInsets.only(bottom: 12),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(task['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(task['location']!),
                                  Text('Urgency level: ${task['urgency']}'),
                                  Text('Assigned by:  ${task['assignedBy']}'),
                                  Text('Status: ', style: const TextStyle(fontWeight: FontWeight.w500)),
                                  Text(
                                    task['status']!,
                                    style: TextStyle(
                                      color: task['status'] == 'Assigned' ? Colors.green : Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  if (task['status'] == 'Assigned')
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Confirm Assignment'),
                                    ),
                                  if (task['status'] == 'Pending')
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(foregroundColor: Colors.green),
                                      child: const Text('Accept task'),
                                    ),
                                ],
                              ),
                            )),
                      ],
                      const SizedBox(height: 8),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text('Settings'),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        onTap: () {
                          MockAuth.logout();
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 