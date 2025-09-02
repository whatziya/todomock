import 'package:flutter/material.dart';

class GreetingWidget extends StatelessWidget {
  static const double _avatarSize = 60;
  static const double _iconSize = 50;
  static const double _borderRadius = 30;

  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Container(
          height: _avatarSize,
          width: _avatarSize,
          decoration: const BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          ),
          child: const Icon(Icons.person, size: _iconSize, color: Colors.white),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hi, User 👋',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Text('Your daily adventure starts now', style: TextStyle(color: Colors.grey[800])),
            ],
          ),
        ),
      ],
    );
  }
}
