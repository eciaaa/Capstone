import 'package:flutter/material.dart';

class VolunteerAllocationSystemScreen extends StatelessWidget {
  const VolunteerAllocationSystemScreen({Key? key}) : super(key: key);

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
                  'Volunteer Allocation System',
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
                    // Create Task Card
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Create Task',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xFF414040),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 18),
                            TextField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: 'Task Description',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                            const SizedBox(height: 14),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Location',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                            const SizedBox(height: 14),
                            DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                hintText: 'Urgency Level (1-5)',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              items: List.generate(5, (i) => DropdownMenuItem(
                                value: i + 1,
                                child: Text('${i + 1}'),
                              )),
                              onChanged: (_) {},
                            ),
                            const SizedBox(height: 14),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Required Skills',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                            const SizedBox(height: 22),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3B4FE4),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Run Volunteer Matching',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Matching Volunteers Card
                    Expanded(
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
                            const Text(
                              'Matching Volunteers',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xFF414040),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 18),
                            _VolunteerCard(
                              name: 'Joshua Louis S. Bernales',
                              team: 'Volunteer - Medical Team',
                              trustScore: '95%',
                              status: 'Active',
                              availability: true,
                            ),
                            const SizedBox(height: 18),
                            _VolunteerCard(
                              name: 'Eriscia Mae Perez',
                              team: 'Volunteer - Logistics Team',
                              trustScore: '90%',
                              status: 'Active',
                              availability: true,
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

class _VolunteerCard extends StatelessWidget {
  final String name;
  final String team;
  final String trustScore;
  final String status;
  final bool availability;
  const _VolunteerCard({
    required this.name,
    required this.team,
    required this.trustScore,
    required this.status,
    required this.availability,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Poppins', color: Color(0xFF414040))),
                const SizedBox(height: 2),
                Text(team, style: const TextStyle(fontSize: 15, color: Color(0xFF414040), fontFamily: 'Poppins')),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('Trust Score: $trustScore', style: const TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'Poppins')),
                    const SizedBox(width: 8),
                    Text('($status)', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Poppins')),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Availability: ', style: TextStyle(fontSize: 14, color: Colors.black54, fontFamily: 'Poppins')),
                    Icon(availability ? Icons.check : Icons.close, color: availability ? Colors.green : Colors.red, size: 18),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text('Assign', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins')),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 