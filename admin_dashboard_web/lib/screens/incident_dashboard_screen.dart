import 'package:flutter/material.dart';

class IncidentDashboardScreen extends StatelessWidget {
  const IncidentDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF14c8a8), Color(0xFF006682)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 8),
          const Text(
            'Incident Management Dashboard',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _IncidentCard(
            avatarColor: Colors.brown,
            userName: 'Anonymous User',
            date: '08/12/2025',
            details: 'Heavy flooding reported due to overnight rainfall',
            email: 'hello@reallygreatsite.com',
            contact: '69+ 974286483',
            location: 'Valenzuela City',
            status: 'Pending',
            statusColor: Colors.orange,
            image: const AssetImage('assets/images/incident_illustration.png'),
          ),
          const SizedBox(height: 24),
          _IncidentCard(
            avatarColor: Colors.blue,
            userName: 'Anonymous User',
            date: '08/12/2025',
            details: 'Heavy flooding reported due to overnight rainfall',
            email: 'hello@reallygreatsite.com',
            contact: '69+ 974286483',
            location: 'Valenzuela City',
            status: 'Pending',
            statusColor: Colors.orange,
            image: const AssetImage('assets/images/incident_illustration.png'),
          ),
          const SizedBox(height: 24),
          _IncidentCard(
            avatarColor: Colors.green,
            userName: 'Anonymous User',
            date: '08/12/2025',
            details: 'Heavy flooding reported due to overnight rainfall',
            email: 'hello@reallygreatsite.com',
            contact: '69+ 974286483',
            location: 'Valenzuela City',
            status: 'Resolved',
            statusColor: Colors.green,
            image: const AssetImage('assets/images/incident_illustration.png'),
          ),
        ],
      ),
    );
  }
}

class _IncidentCard extends StatelessWidget {
  final String userName;
  final String date;
  final String details;
  final String email;
  final String contact;
  final String location;
  final String status;
  final Color statusColor;
  final Color avatarColor;
  final ImageProvider image;

  const _IncidentCard({
    required this.userName,
    required this.date,
    required this.details,
    required this.email,
    required this.contact,
    required this.location,
    required this.status,
    required this.statusColor,
    required this.avatarColor,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(230),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Avatar and info
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: avatarColor.withOpacity(0.15),
                      child: Icon(Icons.person, color: avatarColor, size: 36),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, fontFamily: 'Poppins')),
                        const SizedBox(height: 2),
                        Text(date, style: const TextStyle(fontSize: 13, color: Colors.black54, fontFamily: 'Poppins')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(details, style: const TextStyle(fontSize: 16, fontFamily: 'Poppins')),
                      const SizedBox(height: 10),
                      Text('EMAIL:   $email', style: const TextStyle(fontSize: 14, color: Colors.black87, fontFamily: 'Poppins')),
                      Text('CONTACT: $contact', style: const TextStyle(fontSize: 14, color: Colors.black87, fontFamily: 'Poppins')),
                      Text('LOCATION: $location', style: const TextStyle(fontSize: 14, color: Colors.black87, fontFamily: 'Poppins')),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2ECC71),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Assign Team',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2471A3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Mark Resolved',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE74C3C),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        textStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Dismiss',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Right: Photo and status
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('ATTACHED PHOTO:', style: TextStyle(fontSize: 13, color: Colors.black54, fontFamily: 'Poppins')),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 220,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image(
                      image: image,
                      fit: BoxFit.cover,
                    ),
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