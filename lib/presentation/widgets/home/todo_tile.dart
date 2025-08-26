import 'package:flutter/material.dart';
import 'package:todomock/common/utils/random_color.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    required this.title,
    required this.subtitle,
    required this.tasks,
    required this.progress,
    super.key,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final int tasks;
  final double progress;
  final VoidCallback? onTap;

  static const double _height = 95;
  static const double _borderRadius = 14;
  static const double _progressSize = 50;
  static const double _progressStrokeWidth = 6;

  static const BorderSide _defaultBorder = BorderSide();

  static const BorderSide _bottomBorder = BorderSide(
    width: 5,
  );

  BoxDecoration get _decoration => const BoxDecoration(
    color: Colors.white,
    border: Border(
      left: _defaultBorder,
      top: _defaultBorder,
      right: _defaultBorder,
      bottom: _bottomBorder,
    ),
    borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _height,
        decoration: _decoration,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.check_circle_outline, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '$tasks Tasks',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: _progressSize,
                  width: _progressSize,
                  child: CircularProgressIndicator(
                    strokeWidth: _progressStrokeWidth,
                    strokeCap: StrokeCap.round,
                    value: progress,
                    color: RandomColorUtils.randomBrightColor(),
                  ),
                ),
                Text('${(progress * 100).toInt()}%'),
              ],
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({required this.onTap, super.key});

  final VoidCallback onTap;

  static const double _borderRadius = 14;
  static const BorderSide _defaultBorder = BorderSide();

  static const BorderSide _bottomBorder = BorderSide(
    width: 5,
  );

  BoxDecoration get _decoration => const BoxDecoration(
    color: Colors.white,
    border: Border(
      left: _defaultBorder,
      top: _defaultBorder,
      right: _defaultBorder,
      bottom: _bottomBorder,
    ),
    borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 95,
        decoration: _decoration,
        child: Row(
          children: [
            const SizedBox(width: 16),
            const Text(
              'Add new project',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(child: Container()),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    strokeCap: StrokeCap.round,
                    value: 1,
                    color: RandomColorUtils.randomBrightColor(),
                  ),
                ),
                const Icon(Icons.add, size: 28),
              ],
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}
