import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/presentation/features/add_todo/add_todo.dart';
import 'package:todomock/presentation/features/home/bloc/home_cubit.dart';
import 'package:todomock/presentation/features/home/bloc/home_state.dart';
import 'package:todomock/presentation/features/home/widgets/home/greeting_widget.dart';
import 'package:todomock/presentation/features/home/widgets/home/progress_widget.dart';
import 'package:todomock/presentation/features/home/widgets/home/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..loadScreen(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
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
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is HomeSuccess) {
                        final todos = state.items;
                        if (todos.isEmpty) {
                          return const Center(
                            child: Text(
                              'No tasks yet',
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        }
                        return ListView.separated(
                          itemCount: todos.length,
                          separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final todo = todos[index];
                            return TodoTile(
                              title: todo.title,
                              subtitle: todo.description,
                              tasks: todo.taskCount ?? 0,
                              progress: (todo.progress ?? 0) / 100,
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Failed to load tasks',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
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
