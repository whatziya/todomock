import 'package:flutter/material.dart';
import 'package:todomock/presentation/features/home/widgets/home/progress_card.dart';

class ProgressWidget extends StatelessWidget {
  final int ongoing;
  final int inProcess;
  final int completed;
  final int canceled;

  const ProgressWidget({
    required this.ongoing,
    required this.inProcess,
    required this.completed,
    required this.canceled,
    super.key,
  });

  List<Map<String, dynamic>> get _cardConfigs => [
    {
      'icon': Icons.insights_outlined,
      'color': Colors.blue[600],
      'background': Colors.blue[500],
      'title': 'On going',
      'count': ongoing,
    },
    {
      'icon': Icons.access_time,
      'color': Colors.orange[300],
      'background': Colors.orange[200],
      'title': 'In Process',
      'count': inProcess,
    },
    {
      'icon': Icons.check_circle_outline,
      'color': Colors.cyan[500],
      'background': Colors.cyan[400],
      'title': 'Completed',
      'count': completed,
    },
    {
      'icon': Icons.cancel_outlined,
      'color': Colors.red[400],
      'background': Colors.red[300],
      'title': 'Canceled',
      'count': canceled,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _cardConfigs.length,
      itemBuilder: (context, index) {
        final config = _cardConfigs[index];
        return ProgressCard(
          icon: config['icon'] as IconData,
          color: config['color'] as Color,
          backgroundColor: config['background'] as Color,
          title: config['title'] as String,
          count: config['count'] as int,
        );
      },
    );
  }
}
