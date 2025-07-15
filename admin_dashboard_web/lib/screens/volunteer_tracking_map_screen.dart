import 'package:flutter/material.dart';

class VolunteerTrackingMapScreen extends StatelessWidget {
  const VolunteerTrackingMapScreen({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add a custom back arrow button overlayed at the top left
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 4),
                const Text(
                  'Volunteer Tracking Map',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Map Card
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: Color(0xFF6A8DF6), width: 6),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/map.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Example markers (use Positioned for real map integration)
                            Positioned(
                              left: 80,
                              top: 60,
                              child: _MapMarker(color: Colors.red),
                            ),
                            Positioned(
                              left: 200,
                              top: 120,
                              child: _MapMarker(color: Colors.green),
                            ),
                            Positioned(
                              left: 300,
                              top: 200,
                              child: _MapMarker(color: Colors.orange),
                            ),
                            Positioned(
                              left: 120,
                              top: 250,
                              child: _MapMarker(color: Colors.red),
                            ),
                            Positioned(
                              left: 250,
                              top: 300,
                              child: _MapMarker(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Incident/Task List Card
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search Task, Incident, or Volunteer',
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.search, color: Colors.grey),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            _IncidentCard(
                              name: 'Anonymous User',
                              date: '04/12/2023',
                              description: 'Medical Assistance\nZone 4, Malabon\nMinor Injuries',
                              status: 'Pending',
                              statusColor: Color(0xFFF6B23A),
                            ),
                            const SizedBox(height: 16),
                            _IncidentCard(
                              name: 'Anonymous User',
                              date: '04/12/2023',
                              description: 'Clean Up Drive\nZone 5, Valenzuela\nClogged Drainage and Manholes',
                              status: 'In Progress',
                              statusColor: Color(0xFF2ECC71),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  final Color color;
  const _MapMarker({required this.color, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.location_on, color: color, size: 36);
  }
}

class _IncidentCard extends StatelessWidget {
  final String name;
  final String date;
  final String description;
  final String status;
  final Color statusColor;
  const _IncidentCard({
    required this.name,
    required this.date,
    required this.description,
    required this.status,
    required this.statusColor,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use CircleAvatar for consistent profile icon
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFb2e6e0),
            child: const Icon(Icons.person, color: Color(0xFF14c8a8), size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Poppins', color: Color(0xFF414040))),
                const SizedBox(height: 2),
                Text(date, style: const TextStyle(fontSize: 12, color: Colors.black54, fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.black87, fontFamily: 'Poppins')),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 13, fontFamily: 'Poppins'),
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