import 'package:flutter/material.dart';
import '../utils/theme.dart';
import '../utils/mock_auth.dart';
import 'messages/chat_screen.dart';
import 'incident_report_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'feedback_screen.dart';
import 'location_screen.dart';
import 'help_privacy_screen.dart';
import 'settings_screen.dart';
import 'volunteer/training_modules_screen.dart';
import 'volunteer/handbook_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getUserName() {
    // Mock user name based on user type
    if (MockAuth.currentUserType == UserType.volunteer) {
      return 'Joshua';
    } else {
      return 'Eriscia';
    }
  }

  Widget _buildDrawer() {
    final userType = MockAuth.currentUserType;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.chat_bubble, color: Colors.white, size: 40),
                SizedBox(height: 8),
                Text('ResponSync', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          if (userType == UserType.volunteer) ...[
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Training Modules'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TrainingModulesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Volunteer Handbook'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VolunteerHandbookScreen()),
                );
              },
            ),
          ],
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Location'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LocationScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Feedback'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Help and Privacy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPrivacyScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              MockAuth.logout();
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    final userName = _getUserName();
    final List<Map<String, String>> feed = [
      {
        'name': 'Avegail De Jesus',
        'message': "what's happening in your area?",
        'location': 'Location (e.g. Sitio Uno, Valenzuela)',
      },
      {
        'name': 'Macy Cole David',
        'message': "what's happening in your area?",
        'location': 'Location (e.g. Sitio Uno, Valenzuela)',
      },
      {
        'name': 'Louis Dela Cruz',
        'message': "what's happening in your area?",
        'location': 'Location (e.g. Sitio Uno, Valenzuela)',
      },
      // New anonymous reports
      {
        'name': 'Dariel Taberara',
        'message': 'There is a power outage in our area. Anyone else affected?',
        'location': 'Sitio Dos, Valenzuela',
      },
      {
        'name': 'Samantha Vergara',
        'message': 'Flooding reported near the main road. Please avoid the area.',
        'location': 'Sitio Tres, Valenzuela',
      },
      {
        'name': 'John Rafael',
        'message': 'Lost pet found near the community center. Contact for details.',
        'location': 'Sitio Uno, Valenzuela',
      },
      // Additional anonymous posts
      {
        'name': 'Joseph River',
        'message': 'Barangay 123, Manila: Power outage reported in the area.',
        'location': 'Barangay 123, Manila',
      },
      {
        'name': 'Jamaica Collins',
        'message': 'Road accident at the intersection. Emergency services needed.',
        'location': 'Intersection, Barangay 5',
      },
      {
        'name': 'Timothy Pelaez',
        'message': 'Water supply interruption scheduled for tomorrow.',
        'location': 'Barangay 7, Valenzuela',
      },
    ];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradientStart, gradientEnd],
        ),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use a Stack to layer the volunteer illustration behind the white background and content
              Stack(
                children: [
                  // Foreground content: greeting, search bar, etc.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: Text(
                          'Hello, $userName',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF545454),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFF232B3E),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.search, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                          itemCount: feed.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final item = feed[index];
                            return Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(10),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: gradientStart,
                                        child: Text(item['name']![0], style: const TextStyle(color: Colors.white)),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        item['name']!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'REPORTING TO THE COMMUNITY',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item['message']!,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['location']!,
                                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessagesTab() {
    final List<Map<String, dynamic>> messages = [
      {
        'name': 'Eriscia Mae Perez',
        'avatar': '',
        'lastMessage': 'On the way!',
        'time': '09:00',
        'unread': 3,
      },
      {
        'name': 'Joshua Louis Bernales',
        'avatar': '',
        'lastMessage': 'On my way! Wait a Minute.',
        'time': '08:47',
        'unread': 1,
      },
      {
        'name': 'Avegail Jean',
        'avatar': '',
        'lastMessage': 'Wait',
        'time': '07:40',
        'unread': 1,
      },
      {
        'name': 'Dariel Taberara',
        'avatar': '',
        'lastMessage': 'On my way! Wait a Minute.',
        'time': '09:00',
        'unread': 1,
      },
      {
        'name': 'Louis',
        'avatar': '',
        'lastMessage': 'On my way! Wait a Minute.',
        'time': '09:00',
        'unread': 1,
      },
    ];
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: gradientEnd),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: messages.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(userName: msg['name']),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Profile picture
                            CircleAvatar(
                              backgroundColor: gradientStart,
                              radius: 26,
                              child: Text(
                                msg['name'][0],
                                style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 14),
                            // Name, message, badge
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          msg['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      // Time
                                      Text(
                                        msg['time'],
                                        style: const TextStyle(fontSize: 13, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    msg['lastMessage'],
                                    style: const TextStyle(fontSize: 15, color: Colors.black87),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (msg['unread'] > 0)
                                    Container(
                                      margin: const EdgeInsets.only(top: 6),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: gradientEnd,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        msg['unread'].toString(),
                                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildMessagesTab();
      case 2:
        return IncidentReportScreen();
      case 3:
        return NotificationsScreen();
      case 4:
        return ProfileScreen();
      default:
        return Center(child: Text('Home', style: Theme.of(context).textTheme.titleLarge));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: gradientStart,
        elevation: 0,
        centerTitle: false,
        // No title/logo
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
} 