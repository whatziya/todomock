import 'package:flutter/material.dart';
import 'package:todomock/presentation/features/add_todo/add_todo.dart';
import 'package:todomock/presentation/widgets/home/greeting_widget.dart';
import 'package:todomock/presentation/widgets/home/progress_widget.dart';
import 'package:todomock/presentation/widgets/home/todo_tile.dart';

class HomeScreen extends StatefulWidget {
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

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onAddTodoTap() => showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) => const AddTodo(),
    isScrollControlled: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                    itemCount: HomeScreen._sampleTodos.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final todo = HomeScreen
                          ._sampleTodos[index % HomeScreen._sampleTodos.length];
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
