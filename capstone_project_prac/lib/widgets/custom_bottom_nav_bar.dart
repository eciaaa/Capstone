import 'package:flutter/material.dart';
import '../utils/theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons.mail, 'label': 'Messages'},
      {'icon': Icons.add, 'label': 'Incident'},
      {'icon': Icons.notifications, 'label': 'Notifications'},
      {'icon': Icons.person, 'label': 'Profile'},
    ];
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF9F5FA),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 2, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isActive = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isActive)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [gradientStart, gradientEnd],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: gradientEnd.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        items[index]['icon'] as IconData,
                        color: Colors.white,
                        size: 24,
                      ),
                    )
                  else
                    Icon(
                      items[index]['icon'] as IconData,
                      color: Colors.grey,
                      size: 22,
                    ),
                  const SizedBox(height: 2),
                  Text(
                    items[index]['label'] as String,
                    style: TextStyle(
                      color: isActive ? gradientEnd : Colors.grey,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      fontSize: isActive ? 13 : 11,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
} 