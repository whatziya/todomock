import 'package:flutter/material.dart';
import 'package:todomock/presentation/widgets/greeting_widget.dart';
import 'package:todomock/presentation/widgets/progress_widget.dart';
import 'package:todomock/presentation/widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> _sampleTodos = [
    {
      'title': 'Dashboard for ProSavvy',
      'subtitle': 'Digital Product Design',
      'tasks': 12,
      'progress': 0.75,
    },
    {
      'title': 'Mobile App UI',
      'subtitle': 'iOS Development',
      'tasks': 8,
      'progress': 0.45,
    },
    {
      'title': 'Website Redesign',
      'subtitle': 'Web Development',
      'tasks': 15,
      'progress': 0.90,
    },
    {
      'title': 'Brand Identity',
      'subtitle': 'Graphic Design',
      'tasks': 6,
      'progress': 0.30,
    },
  ];

  void _onAddTodoTap() {
    debugPrint('Add todo tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingWidget(),
                const SizedBox(height: 24),
                const ProgressWidget(
                  ongoing: 24,
                  inProcess: 12,
                  completed: 42,
                  canceled: 8,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Recent Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                AddTodoTile(onTap: _onAddTodoTap),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    itemCount: _sampleTodos.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final todo = _sampleTodos[index % _sampleTodos.length];
                      return TodoTile(
                        title: todo['title'] as String,
                        subtitle: todo['subtitle'] as String,
                        tasks: todo['tasks'] as int,
                        progress: todo['progress'] as double,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
