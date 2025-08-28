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

  BoxDecoration get _decoration => const BoxDecoration(
    color: Colors.white,
    border: Border(
      left: BorderSide(),
      top: BorderSide(),
      right: BorderSide(),
      bottom: BorderSide(
        width: 5,
      ),
    ),
    borderRadius: BorderRadius.all(Radius.circular(14)),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 95,
        decoration: _decoration,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 24),
          child: Row(
            children: [
              /// Wrap texts in Expanded to prevent overflow
              Expanded(
                child: Column(
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
                        Flexible(
                          child: Text(
                            '$tasks Tasks',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Progress indicator stays fixed
              const SizedBox(width: 12),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      strokeCap: StrokeCap.round,
                      value: progress,
                      color: RandomColorUtils.randomBrightColor(),
                    ),
                  ),
                  Text('${(progress * 100).toInt()}%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({required this.onTap, super.key});

  final VoidCallback onTap;

  BoxDecoration get _decoration => const BoxDecoration(
    color: Colors.white,
    border: Border(
      left: BorderSide(),
      top: BorderSide(),
      right: BorderSide(),
      bottom: BorderSide(
        width: 5,
      ),
    ),
    borderRadius: BorderRadius.all(Radius.circular(14)),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 95,
        decoration: _decoration,
        child: const Padding(
          padding: EdgeInsets.only(left: 16, right: 24),
          child: Row(
            children: [
              Text(
                'Add new project',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
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
                      color: Colors.grey,
                    ),
                  ),
                  Icon(Icons.add, size: 28),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
