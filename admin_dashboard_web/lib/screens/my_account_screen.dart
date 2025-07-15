import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF14c8a8), Color(0xFF006682)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 18),
                // Profile Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFb2e6e0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xFFe5734a),
                        child: Icon(Icons.person, size: 60, color: Colors.white),
                      ),
                      const SizedBox(width: 24),
                      // Name and Role
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Admin Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Color(0xFF414040), fontFamily: 'Poppins')),
                            SizedBox(height: 4),
                            Text('Admin User', style: TextStyle(fontSize: 18, color: Color(0xFF414040), fontFamily: 'Poppins')),
                          ],
                        ),
                      ),
                      // Edit Button
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, size: 18, color: Color(0xFF414040)),
                        label: const Text('Edit', style: TextStyle(color: Color(0xFF414040), fontFamily: 'Poppins')),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Personal Information Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFb2e6e0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Personal Information',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xFF414040),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.edit, size: 18, color: Color(0xFF414040)),
                            label: const Text('Edit', style: TextStyle(color: Color(0xFF414040), fontFamily: 'Poppins')),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          // First Name
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('First Name', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                                SizedBox(height: 2),
                                Text('Admin', style: TextStyle(fontSize: 18, color: Color(0xFF414040), fontFamily: 'Poppins')),
                              ],
                            ),
                          ),
                          // Last Name
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Last Name', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                                SizedBox(height: 2),
                                Text('Name', style: TextStyle(fontSize: 18, color: Color(0xFF414040), fontFamily: 'Poppins')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          // Email
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Email Address', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                                SizedBox(height: 2),
                                Text('adminuser@gmail.com', style: TextStyle(fontSize: 18, color: Color(0xFF414040), fontFamily: 'Poppins')),
                              ],
                            ),
                          ),
                          // Phone
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Phone Number / Hotline', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                                SizedBox(height: 2),
                                Text('09123456789 / 8352-5000', style: TextStyle(fontSize: 18, color: Color(0xFF414040), fontFamily: 'Poppins')),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      // Bio
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Bio', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
                          SizedBox(height: 2),
                          Text('Admin User', style: TextStyle(fontSize: 18, color: Color(0xFF414040), fontFamily: 'Poppins')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 