import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/common/di/service_locator.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(sl<TodoRepository>()),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          bottom: false,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GreetingWidget(),
                    const SizedBox(height: 24),
                    //////////////////////////////////////////////////
                    const ProgressWidget(
                      ongoing: 24,
                      inProcess: 12,
                      completed: 42,
                      canceled: 8,
                    ),
                    //////////////////////////////////////////////////
                    const Text(
                      'Recent Task',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    //////////////////////////////////////////////////
                    AddTodoTile(onTap: _onAddTodoTap),
                    const SizedBox(height: 10),
                    //////////////////////////////////////////////////
                    if (state is HomeLoading) ...[
                      const SizedBox(height: 200),
                      const Center(child: CircularProgressIndicator()),
                      const SizedBox(height: 200),
                    ] else if (state is HomeSuccess) ...[
                      if (state.items.isEmpty) ...[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: Text(
                              'No tasks yet',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ] else ...[
                        Column(
                          children: List.generate(state.items.length, (index) {
                            final todo = state.items[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TodoTile(
                                title: todo.title,
                                subtitle: todo.description,
                                tasks: todo.taskCount,
                                progress: (todo.progress) / 100,
                              ),
                            );
                          }),
                        ),
                      ],
                    ] else ...[
                      const SizedBox(height: 200),
                      const Center(
                        child: Text(
                          'Failed to load tasks',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      const SizedBox(height: 200),
                    ],
                    //////////////////////////////////////////////////
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onAddTodoTap() => showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) => const AddTodo(),
    isScrollControlled: true,
  );
}
