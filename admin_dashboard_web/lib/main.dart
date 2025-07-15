import 'package:flutter/material.dart';
import 'screens/incident_dashboard_screen.dart';
import 'screens/volunteer_management_screen.dart';
import 'screens/manage_accounts_screen.dart';
import 'screens/resources_supplies_screen.dart';
import 'screens/send_alert_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/my_account_screen.dart';
import 'screens/sign_out_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/volunteer_allocation_system_screen.dart';
import 'screens/volunteer_tracking_map_screen.dart';

void main() {
  runApp(const AdminDashboardApp());
}

class AdminDashboardApp extends StatelessWidget {
  const AdminDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ResponSync Admin Dashboard',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const AdminLoginScreen(),
        '/signup': (context) => const AdminSignUpScreen(),
        '/dashboard': (context) => const AdminDashboardLayout(),
        '/volunteer-allocation': (context) => const VolunteerAllocationSystemScreen(),
        '/volunteer-tracking': (context) => const VolunteerTrackingMapScreen(),
      },
    );
  }
}

class AdminDashboardLayout extends StatefulWidget {
  const AdminDashboardLayout({super.key});

  @override
  State<AdminDashboardLayout> createState() => _AdminDashboardLayoutState();
}

class _AdminDashboardLayoutState extends State<AdminDashboardLayout> {
  int _selectedIndex = 0;

  static const List<String> _sidebarLabels = [
    'Home',
    'Incident Dashboard',
    'Volunteer Management',
    'Manage Accounts',
    'Resources and Supplies',
    'Send Alert',
    'Settings',
    'My Account',
    'Sign Out',
  ];

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const HomePageScreen();
      case 1:
        return const IncidentDashboardScreen();
      case 2:
        return const VolunteerManagementScreen();
      case 3:
        return const ManageAccountsScreen();
      case 4:
        return const ResourcesSuppliesScreen();
      case 5:
        return const SendAlertScreen();
      case 6:
        return const SettingsScreen();
      case 7:
        return const MyAccountScreen();
      case 8:
        return const SignOutScreen();
      default:
        return const HomePageScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 260,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and app name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo1.png',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'ResponSync',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF414040), // Updated color
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Menu items
                Expanded(
                  child: ListView(
                    children: [
                      for (int i = 0; i < _sidebarLabels.length; i++)
                        _SidebarItem(
                          icon: _getSidebarIcon(i),
                          label: _sidebarLabels[i],
                          selected: _selectedIndex == i,
                          onTap: () {
                            if (i == 8) {
                              // Sign Out: Navigate to login and reset index
                              Navigator.pushReplacementNamed(context, '/login');
                              setState(() {
                                _selectedIndex = 0;
                              });
                            } else {
                              setState(() {
                                _selectedIndex = i;
                              });
                            }
                          },
                        ),
                      const Divider(color: Colors.white24, height: 32, thickness: 1, indent: 16, endIndent: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: const [
                            Icon(Icons.help_outline, color: Colors.white70, size: 20),
                            SizedBox(width: 8),
                            Text('Help', style: TextStyle(color: Colors.white70, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Main content: dynamic screen
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF14c8a8), Color(0xFF006682)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
                child: _getScreen(_selectedIndex),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

IconData _getSidebarIcon(int index) {
  switch (index) {
    case 0:
      return Icons.home;
    case 1:
      return Icons.dashboard;
    case 2:
      return Icons.group;
    case 3:
      return Icons.manage_accounts;
    case 4:
      return Icons.inventory;
    case 5:
      return Icons.warning;
    case 6:
      return Icons.settings;
    case 7:
      return Icons.person;
    case 8:
      return Icons.logout;
    default:
      return Icons.home;
  }
}

// Placeholder screens for each sidebar item
class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Full-width gradient background
        Container(
          width: double.infinity,
          height: 370,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF14c8a8), Color(0xFF006682)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        // Main content
        SingleChildScrollView(
          child: Column(
            children: [
              // Top section: greeting and search bar
              Padding(
                padding: EdgeInsets.only(left: 60, right: 60, top: 48, bottom: 0),
                child: Stack(
                  children: [
                    // Greeting and search bar
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello,',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Text(
                          'Admin Name',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: Container(
                            width: screenWidth > 700 ? 480 : screenWidth * 0.8,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF23374D),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.search, color: Colors.white),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                    // Volunteer illustration floating above the card, right side
                    Positioned(
                      right: 0,
                      top: 0,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth > 700 ? 180 : 100,
                          maxHeight: screenWidth > 700 ? 220 : 120,
                        ),
                        child: Image.asset(
                          'assets/images/volunteer.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // White rounded content container
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 1100),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(32, 40, 32, 32),
                child: Column(
                  children: [
                    _CommunityReportCard(
                      userName: 'Anonymous User',
                      userAvatar: Icons.person,
                      urgent: true,
                      message: 'URGENT: SEND HELP',
                      details: 'Sitio Uno, Valenzuela needs urgent help—please send food, water, and support to affected families.',
                      imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                    ),
                    const SizedBox(height: 24),
                    _CommunityReportCard(
                      userName: 'Anonymous User',
                      userAvatar: Icons.person,
                      urgent: false,
                      message: 'Reporting to the community',
                      details: 'Barangay 123, Manila: Power outage reported in the area.',
                      imageUrl: null,
                    ),
                    const SizedBox(height: 24),
                    _CommunityReportCard(
                      userName: 'Anonymous User',
                      userAvatar: Icons.person,
                      urgent: false,
                      message: 'Reporting to the community',
                      details: 'Barangay 456, Quezon City: Heavy flooding near the riverbank, requesting immediate help.',
                      imageUrl: null,
                    ),
                    const SizedBox(height: 24),
                    _CommunityReportCard(
                      userName: 'Anonymous User',
                      userAvatar: Icons.person,
                      urgent: false,
                      message: 'Reporting to the community',
                      details: 'Barangay 789, Pasig City: One of the main streetlights has been out for two nights.',
                      imageUrl: null,
                    ),
                    const SizedBox(height: 24),
                    _CommunityReportCard(
                      userName: 'Anonymous User',
                      userAvatar: Icons.person,
                      urgent: false,
                      message: 'Reporting to the community',
                      details: 'Barangay 321, Makati City: Smoke seen from an abandoned building. Possible fire outbreak.',
                      imageUrl: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CommunityReportCard extends StatelessWidget {
  final String userName;
  final IconData userAvatar;
  final bool urgent;
  final String message;
  final String details;
  final String? imageUrl;

  const _CommunityReportCard({
    required this.userName,
    required this.userAvatar,
    required this.urgent,
    required this.message,
    required this.details,
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: const Color(0xFFe0e0e0),
                child: Icon(userAvatar, size: 38, color: Colors.brown),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  const SizedBox(height: 2),
                  const Text('REPORTING TO THE COMMUNITY', style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          if (urgent)
            Text('🚨 URGENT: SEND HELP 🚨', style: TextStyle(fontSize: 16, color: Colors.red[700], fontWeight: FontWeight.bold)),
          if (urgent) const SizedBox(height: 6),
          Text(details, style: const TextStyle(fontSize: 16)),
          if (imageUrl != null) ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(imageUrl!, width: 320, height: 180, fit: BoxFit.cover),
            ),
          ],
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
          decoration: selected
              ? BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF14c8a8), Color(0xFF006682)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                )
              : null,
          child: ListTile(
            leading: Icon(
              icon,
              color: selected ? Colors.white : Colors.grey[700],
              size: 22,
            ),
            title: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey[800],
                fontSize: 16,
                fontWeight: selected ? FontWeight.bold : FontWeight.w600,
                fontFamily: 'Poppins',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            selected: selected,
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            horizontalTitleGap: 14,
          ),
        );
      },
    );
  }
}
