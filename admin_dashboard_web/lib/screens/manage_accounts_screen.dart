import 'package:flutter/material.dart';

class ManageAccountsScreen extends StatelessWidget {
  const ManageAccountsScreen({super.key});

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
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Barangay Official Dashboard',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Manage User Accounts',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFb2e6e0).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Volunteer Profiles',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF414040),
                            fontFamily: 'Poppins',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final isWide = constraints.maxWidth > 700;
                            return GridView.count(
                              crossAxisCount: isWide ? 2 : 1,
                              shrinkWrap: true,
                              mainAxisSpacing: 28,
                              crossAxisSpacing: 28,
                              childAspectRatio: 2.7,
                              physics: const NeverScrollableScrollPhysics(),
                              children: const [
                                _VolunteerProfileCard(
                                  name: 'Joshua Louis S. Bernales',
                                  team: 'Volunteer - Medical Team',
                                  trustScore: '95%',
                                  avatarColor: Colors.orange,
                                  status: 'Active',
                                ),
                                _VolunteerProfileCard(
                                  name: 'Eriscia Mae Perez',
                                  team: 'Volunteer - Logistics Team',
                                  trustScore: '90%',
                                  avatarColor: Colors.blue,
                                  status: 'Active',
                                ),
                                _VolunteerProfileCard(
                                  name: 'Dariel S. Taberara',
                                  team: 'Volunteer - Rescue Team',
                                  trustScore: '89%',
                                  avatarColor: Colors.purple,
                                  status: 'Active',
                                ),
                                _VolunteerProfileCard(
                                  name: 'Avegail Jean C. De Jesus',
                                  team: 'Volunteer - Rescue Team',
                                  trustScore: '99%',
                                  avatarColor: Colors.brown,
                                  status: 'Active',
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VolunteerProfileCard extends StatelessWidget {
  final String name;
  final String team;
  final String trustScore;
  final Color avatarColor;
  final String status;
  const _VolunteerProfileCard({
    required this.name,
    required this.team,
    required this.trustScore,
    required this.avatarColor,
    required this.status,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: avatarColor.withOpacity(0.18),
            child: Icon(Icons.person, color: avatarColor, size: 44),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Stack(
              children: [
                // Text content column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Poppins', color: Color(0xFF414040))),
                    const SizedBox(height: 4),
                    Text(team, style: const TextStyle(fontSize: 15, color: Color(0xFF414040), fontFamily: 'Poppins')),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Trust Score: $trustScore', style: const TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'Poppins')),
                        const SizedBox(width: 8),
                        Text('($status)', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Poppins')),
                      ],
                    ),
                  ],
                ),
                // Archive button bottom right
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE74C3C),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      elevation: 0,
                    ),
                    child: const Text('Archive', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 