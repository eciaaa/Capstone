import 'package:flutter/material.dart';
import '../utils/theme.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom AppBar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.black54),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          // Map with markers
          Expanded(
            child: Stack(
              children: [
                // Stylized custom graphics map background
                Positioned.fill(
                  child: Container(
                    color: Colors.grey[200],
                    child: CustomPaint(
                      painter: _StylizedMapPainter(),
                    ),
                  ),
                ),
                // Markers (example positions)
                ...[
                  const Offset(80, 80),
                  const Offset(200, 120),
                  const Offset(150, 200),
                  const Offset(250, 60),
                  const Offset(300, 180),
                  const Offset(100, 250),
                  const Offset(220, 260),
                ].asMap().entries.map((entry) {
                  final idx = entry.key;
                  final pos = entry.value;
                  final color = idx % 3 == 0
                      ? Colors.red
                      : idx % 3 == 1
                          ? Colors.orange
                          : Colors.green;
                  return Positioned(
                    left: pos.dx,
                    top: pos.dy,
                    child: Icon(Icons.location_on, color: color, size: 32),
                  );
                }).toList(),
                // Bottom card
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Carousel dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (i) =>
                            Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                color: i == 0 ? gradientEnd : Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Profile and location
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.grey[300],
                              child: Icon(Icons.person, size: 32, color: gradientEnd),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('✔ Your Location', style: TextStyle(color: Colors.green, fontSize: 13)),
                                SizedBox(height: 2),
                                Text('Metro Manila', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Location list
                        Column(
                          children: List.generate(2, (i) =>
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on, color: gradientEnd, size: 22),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 12,
                                          width: 120,
                                          color: Colors.grey[300],
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          height: 10,
                                          width: 80,
                                          color: Colors.grey[200],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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

// Custom painter for a stylized map with blocks and curved roads
class _StylizedMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blockPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    final roadPaint = Paint()
      ..color = Colors.grey[400]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    // Draw soft blocks
    for (double y = 40; y < size.height; y += 100) {
      for (double x = 30; x < size.width; x += 120) {
        final r = Rect.fromLTWH(x, y, 80, 60);
        canvas.drawRRect(
          RRect.fromRectAndRadius(r, const Radius.circular(24)),
          blockPaint,
        );
      }
    }

    // Draw curved roads
    final path1 = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.3, size.width, size.height * 0.15);
    canvas.drawPath(path1, roadPaint);

    final path2 = Path()
      ..moveTo(0, size.height * 0.5)
      ..cubicTo(size.width * 0.2, size.height * 0.6, size.width * 0.8, size.height * 0.4, size.width, size.height * 0.6);
    canvas.drawPath(path2, roadPaint);

    final path3 = Path()
      ..moveTo(size.width * 0.1, 0)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.5, size.width * 0.15, size.height);
    canvas.drawPath(path3, roadPaint);

    final path4 = Path()
      ..moveTo(size.width * 0.7, 0)
      ..quadraticBezierTo(size.width * 0.8, size.height * 0.5, size.width * 0.9, size.height);
    canvas.drawPath(path4, roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 