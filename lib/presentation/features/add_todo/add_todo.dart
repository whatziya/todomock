import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/common/di/service_locator.dart';
import 'package:todomock/common/utils/random_color.dart';
import 'package:todomock/domain/repositories/todo_repository.dart';
import 'package:todomock/presentation/features/add_todo/blocs/default_cubit/add_todo_cubit.dart';
import 'package:todomock/presentation/features/add_todo/blocs/default_cubit/add_todo_state.dart';
import 'package:todomock/presentation/features/add_todo/blocs/validate_todo/validate_todo_cubit.dart';
import 'package:todomock/presentation/features/add_todo/blocs/validate_todo/validate_todo_state.dart';
import 'package:todomock/presentation/features/add_todo/widgets/custom_button.dart';
import 'package:todomock/presentation/features/add_todo/widgets/custom_description_edit_text.dart';
import 'package:todomock/presentation/features/add_todo/widgets/custom_title_edit_text.dart';
import 'package:todomock/presentation/features/add_todo/widgets/time_calendar/calendar_widget.dart';
import 'package:todomock/presentation/features/add_todo/widgets/time_calendar/time_widget.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  late final TextEditingController _titleController;
  late final TextEditingController _hourController;
  late final TextEditingController _minutesController;
  late final TextEditingController _descriptionController;
  late final Color _randomColor;

  int? _selectedDay;
  late int _year;
  late int _month;
  late int _today;
  bool _alert = true;

  @override
  void initState() {
    super.initState();
    _initializeState();
    _initializeControllers();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _hourController.dispose();
    _minutesController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddTodoCubit(sl<TodoRepository>())),
        BlocProvider(create: (_) => ValidateTodoCubit()),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: BlocConsumer<AddTodoCubit, AddTodoState>(
          listener: (context, state) {
            if (state is AddToDoSuccess) Navigator.pop(context);
          },
          builder: (context, addState) {
            return SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Center(child: Icon(Icons.close, color: Colors.black)),
                      ),
                    ),

                    const Text(
                      'New Task',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),

                    CustomTitleEditText(hint: 'Task Title', controller: _titleController),

                    CalendarWidget(
                      year: _year,
                      month: _month,
                      selectedDay: _selectedDay ?? 0,
                      onNextDateFrame: _nextDateFrame,
                      onPreviousDateFrame: _previousDateFrame,
                      onDayTap: _dayTap,
                    ),

                    Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: TimeWidget(
                            controller: _hourController,
                            timeWidgetType: TimeWidgetType.hour,
                          ),
                        ),
                        Expanded(
                          child: TimeWidget(
                            controller: _minutesController,
                            timeWidgetType: TimeWidgetType.minute,
                          ),
                        ),
                      ],
                    ),

                    CustomDescriptionEditText(
                      hint: 'Add your task details',
                      controller: _descriptionController,
                    ),

                    Row(
                      children: [
                        const Text(
                          'Get alert for this task',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: 0.9,
                          child: Switch(
                            value: _alert,
                            onChanged: (value) => setState(() => _alert = value),
                            trackColor: WidgetStatePropertyAll(Colors.grey[400]),
                            thumbColor: WidgetStatePropertyAll(_randomColor),
                          ),
                        ),
                      ],
                    ),

                    /// Validation error banner at the top
                    BlocBuilder<ValidateTodoCubit, ValidateTodoState>(
                      builder: (context, state) {
                        final errorMessage = switch (state) {
                          ValidateToDoInvalidTitle() =>
                            'Title must be at least 6 characters long',
                          ValidateToDoInvalidTime() => 'Please select a valid future time',
                          _ => null,
                        };
                        if (errorMessage == null) return const SizedBox.shrink();

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        );
                      },
                    ),
                    CustomButton(
                      onTap: addState.isLoading ? null : () => _validateThenSubmit(context),
                      randomColor: _randomColor,
                      isLoading: addState.isLoading,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _initializeState() {
    final now = DateTime.now();
    _year = now.year;
    _month = now.month;
    _today = now.day;
    _selectedDay = _today;
    _randomColor = RandomColorUtils.randomBrightColor();
  }

  void _initializeControllers() {
    final now = DateTime.now();
    _titleController = TextEditingController();
    _hourController = TextEditingController(text: now.hour.toString().padLeft(2, '0'));
    _minutesController = TextEditingController(text: now.minute.toString().padLeft(2, '0'));
    _descriptionController = TextEditingController();
  }

  void _validateThenSubmit(BuildContext context) {
    context.read<ValidateTodoCubit>().validateToDoItem(
      title: _titleController.text,
      year: _year,
      month: _month,
      day: _selectedDay ?? 0,
      hour: int.tryParse(_hourController.text) ?? 0,
      minute: int.tryParse(_minutesController.text) ?? 0,
      mustAlert: _alert,
    );

    final validationState = context.read<ValidateTodoCubit>().state;
    if (validationState is ValidateToDoSuccess) {
      _addToDoItem(context);
    }
  }

  void _addToDoItem(BuildContext context) {
    context.read<AddTodoCubit>().addToDoItem(
      title: _titleController.text.trim(),
      year: _year,
      month: _month,
      day: _selectedDay ?? 0,
      hour: int.tryParse(_hourController.text) ?? 0,
      minute: int.tryParse(_minutesController.text) ?? 0,
      description: _descriptionController.text.trim(),
      mustAlert: _alert,
    );
  }

  void _nextDateFrame() {
    setState(() {
      if (_month == 12) {
        _year++;
        _month = 1;
      } else {
        _month++;
      }
      _selectedDay = null;
    });
  }

  void _previousDateFrame() {
    setState(() {
      if (_month == 1) {
        _year--;
        _month = 12;
      } else {
        _month--;
      }
      _selectedDay = null;
    });
  }

  void _dayTap(int day) => setState(() => _selectedDay = day);
}
