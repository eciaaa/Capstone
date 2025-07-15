import 'package:flutter/material.dart';

class VolunteerManagementScreen extends StatelessWidget {
  const VolunteerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: null,
      body: Stack(
        children: [
          Container(
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
                        'Volunteer Application and Registration',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2d4666),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(1.5),
                            2: FlexColumnWidth(1.5),
                            3: FlexColumnWidth(2.5),
                          },
                          border: TableBorder.symmetric(inside: BorderSide.none, outside: BorderSide.none),
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(),
                              children: [
                                _TableHeader('Name'),
                                _TableHeader('Volunteer Type'),
                                _TableHeader('Status'),
                                _TableHeader('Actions'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Table rows
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: [
                            _VolunteerRow(
                              name: 'Joshua Louis S. Bernales',
                              type: 'Medical',
                              status: 'Send Revision',
                              statusColor: Colors.orange,
                              acceptColor: Colors.green,
                              rejectColor: Colors.red,
                              revisionColor: Colors.orange,
                            ),
                            _VolunteerRow(
                              name: 'Eriscia Mae Perez',
                              type: 'Logistics',
                              status: 'Pending',
                              statusColor: Colors.orange,
                              acceptColor: Colors.green,
                              rejectColor: Colors.red,
                              revisionColor: Colors.orange,
                            ),
                            _VolunteerRow(
                              name: 'Avegail Jean C. De Jesus',
                              type: 'Rescue',
                              status: 'Accepted',
                              statusColor: Colors.green,
                              acceptColor: Colors.green,
                              rejectColor: Colors.red,
                              revisionColor: Colors.orange,
                            ),
                            _VolunteerRow(
                              name: 'Dariel S. Taberara',
                              type: 'Rescue',
                              status: 'Rejected',
                              statusColor: Colors.red,
                              acceptColor: Colors.green,
                              rejectColor: Colors.red,
                              revisionColor: Colors.orange,
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
          // Three-dot menu at top-right
          Positioned(
            top: 16,
            right: 16,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'allocation') {
                  Navigator.pushNamed(context, '/volunteer-allocation');
                } else if (value == 'tracking') {
                  Navigator.pushNamed(context, '/volunteer-tracking');
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'allocation',
                  child: Text('Volunteer Allocation System'),
                ),
                const PopupMenuItem(
                  value: 'tracking',
                  child: Text('Volunteer Tracking Map'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  final String label;
  const _TableHeader(this.label, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _VolunteerRow extends StatelessWidget {
  final String name;
  final String type;
  final String status;
  final Color statusColor;
  final Color acceptColor;
  final Color rejectColor;
  final Color revisionColor;
  const _VolunteerRow({
    required this.name,
    required this.type,
    required this.status,
    required this.statusColor,
    required this.acceptColor,
    required this.rejectColor,
    required this.revisionColor,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.5),
          3: FlexColumnWidth(2.5),
        },
        border: TableBorder.symmetric(inside: BorderSide.none, outside: BorderSide.none),
        children: [
          TableRow(
            decoration: const BoxDecoration(),
            children: [
              _TableCell(name),
              _TableCell(type),
              _StatusCell(status, statusColor),
              _ActionCell(acceptColor: acceptColor, rejectColor: rejectColor, revisionColor: revisionColor),
            ],
          ),
        ],
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String value;
  const _TableCell(this.value, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      child: Text(
        value,
        style: const TextStyle(
          color: Color(0xFF414040),
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _StatusCell extends StatelessWidget {
  final String status;
  final Color color;
  const _StatusCell(this.status, this.color, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ActionCell extends StatelessWidget {
  final Color acceptColor;
  final Color rejectColor;
  final Color revisionColor;
  const _ActionCell({required this.acceptColor, required this.rejectColor, required this.revisionColor, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ActionButton(label: 'ACCEPT', color: acceptColor),
          _ActionButton(label: 'REJECT', color: rejectColor),
          _ActionButton(label: 'Send Revision', color: revisionColor),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  const _ActionButton({required this.label, required this.color, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.18),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
} 