import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todomock/common/utils/random_color.dart';
import 'package:todomock/presentation/features/add_todo/bloc/add_todo_cubit.dart';
import 'package:todomock/presentation/features/add_todo/bloc/add_todo_state.dart';
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
  bool alert = true;
  late final TextEditingController _titleController;
  late final TextEditingController _hourController;
  late final TextEditingController _minutesController;
  late final TextEditingController _descriptionController;
  late final AddTodoCubit _addTodoCubit;
  late final Color randomColor;
  late int year;
  late int month;
  late int today;
  int? selectedDay;

  void addToDoItem({
    required String title,
    required int year,
    required int month,
    required int day,
    required int hour,
    required int minute,
    required String description,
    required bool mustAlert,
  }) {
    _addTodoCubit.addToDoItem(
      title: _titleController.text.trim(),
      year: year,
      month: month,
      day: day,
      hour: int.tryParse(_hourController.text) ?? 0,
      minute: int.tryParse(_minutesController.text) ?? 0,
      description: _descriptionController.text.trim(),
      mustAlert: alert,
    );
  }

  @override
  void initState() {
    super.initState();
    _addTodoCubit = AddTodoCubit();
    final now = DateTime.now();

    year = now.year;
    month = now.month;
    today = now.day;
    selectedDay = today;

    _titleController = TextEditingController();
    _hourController = TextEditingController(
      text: now.hour.toString().padLeft(2, '0'),
    );
    _minutesController = TextEditingController(
      text: now.minute.toString().padLeft(2, '0'),
    );
    _descriptionController = TextEditingController();

    randomColor = RandomColorUtils.randomBrightColor();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _hourController.dispose();
    _minutesController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onSwitchChanged(bool value) {
    if (alert != value) {
      setState(() => alert = value);
    }
  }

  void _nextDateFrame() {
    setState(() {
      if (month == 12) {
        year++;
        month = 1;
      } else {
        month++;
      }
      selectedDay = null;
    });
  }

  void _previousDateFrame() {
    setState(() {
      if (month == 1) {
        year--;
        month = 12;
      } else {
        month--;
      }
      selectedDay = null;
    });
  }

  void _dayTap(int day) {
    setState(() {
      selectedDay = day;
    });
  }

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  String _getErrorMessage(AddTodoState state) {
    return switch (state.runtimeType) {
      const (AddToDoInvalidTitle) => 'Title must be at least 6 characters long',
      const (AddToDoInvalidYear) => 'Please select a valid year',
      const (AddToDoInvalidMonth) => 'Please select a valid month',
      const (AddToDoInvalidDay) => 'Please select a valid day',
      const (AddToDoInvalidTime) => 'Please select a valid time',
      const (AddToDoFailure) => 'Failed to create task. Please try again.',
      _ => 'An error occurred',
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddTodoCubit>(
      create: (context) => _addTodoCubit,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.grey[200],
          child: BlocConsumer<AddTodoCubit, AddTodoState>(
            listener: (context, state) {
              switch (state.runtimeType) {
                case const (AddToDoSuccess):
                  _showMessage('Task created successfully!');
                  Navigator.pop(context);
                case const (AddToDoInvalidTitle):
                case const (AddToDoInvalidYear):
                case const (AddToDoInvalidMonth):
                case const (AddToDoInvalidDay):
                case const (AddToDoInvalidTime):
                case const (AddToDoFailure):
                  _showMessage(_getErrorMessage(state), isError: true);
              }
            },
            builder: (context, state) {
              final isLoading = state is AddToDoLoading;

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Close Button
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Icon(Icons.close, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      //Title
                      const Text(
                        'New tasks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                      const SizedBox(height: 16),

                      //Inputs
                      CustomTitleEditText(
                        hint: 'Task Title',
                        controller: _titleController,
                      ),
                      const SizedBox(height: 16),
                      CalendarWidget(
                        year: year,
                        month: month,
                        selectedDay: selectedDay ?? 0,
                        onNextDateFrame: _nextDateFrame,
                        onPreviousDateFrame: _previousDateFrame,
                        onDayTap: _dayTap,
                      ),
                      const SizedBox(height: 16),

                      //Time selectors
                      Row(
                        children: [
                          Expanded(
                            child: TimeWidget(
                              controller: _hourController,
                              timeWidgetType: TimeWidgetType.hour,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TimeWidget(
                              controller: _minutesController,
                              timeWidgetType: TimeWidgetType.minute,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      CustomDescriptionEditText(
                        hint: 'Add your task details',
                        controller: _descriptionController,
                      ),
                      const Spacer(),

                      Row(
                        children: [
                          const Text(
                            'Get alert for this task',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Transform.scale(
                            scale: 0.9,
                            child: Switch(
                              value: alert,
                              onChanged: _onSwitchChanged,
                              trackColor: WidgetStatePropertyAll(
                                Colors.grey[400],
                              ),
                              thumbColor: WidgetStatePropertyAll(randomColor),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),

                      CustomButton(
                        onTap: isLoading
                            ? null
                            : () => addToDoItem(
                                title: _titleController.text,
                                year: year,
                                day: selectedDay ?? today,
                                month: month,
                                hour: int.tryParse(_hourController.text) ?? 0,
                                minute:
                                    int.tryParse(_minutesController.text) ?? 0,
                                description: _descriptionController.text,
                                mustAlert: alert,
                              ),
                        randomColor: randomColor,
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
