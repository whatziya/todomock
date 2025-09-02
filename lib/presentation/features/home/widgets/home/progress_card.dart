import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  static const double _containerSize = 45;
  static const double _iconSize = 25;
  static const double _borderRadius = 22.5;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final String title;
  final int count;

  const ProgressCard({
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.title,
    required this.count,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: Row(
        spacing: 8,
        children: [
          Container(
            height: _containerSize,
            width: _containerSize,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(_borderRadius)),
            ),
            child: Icon(icon, size: _iconSize, color: Colors.white),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('$count Tasks', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
