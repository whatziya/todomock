import 'package:flutter/material.dart';
import 'package:todomock/common/utils/random_color.dart';
import 'package:todomock/presentation/widgets/add_todo/custom_button.dart';
import 'package:todomock/presentation/widgets/add_todo/custom_description_edit_text.dart';
import 'package:todomock/presentation/widgets/add_todo/custom_title_edit_text.dart';
import 'package:todomock/presentation/widgets/time_calendar/calendar_widget.dart';
import 'package:todomock/presentation/widgets/time_calendar/time_widget.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  bool alert = true;
  late final TextEditingController _hourController;
  late final TextEditingController _minutesController;
  late final Color randomColor;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();

    _hourController = TextEditingController(
      text: now.hour.toString().padLeft(2, '0'),
    );
    _minutesController = TextEditingController(
      text: now.minute.toString().padLeft(2, '0'),
    );

    randomColor = RandomColorUtils.randomBrightColor();
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minutesController.dispose();
    super.dispose();
  }

  void _onSwitchChanged(bool value) {
    if (alert != value) {
      setState(() => alert = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: SafeArea(
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              const SizedBox(height: 16),

              //Inputs
              const CustomTitleEditText(hint: 'Task Title'),
              const SizedBox(height: 16),
              const CalendarWidget(),
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

              const CustomDescriptionEditText(hint: 'Add your task details'),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    'Get alert for this task',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      value: alert,
                      onChanged: _onSwitchChanged,
                      trackColor: WidgetStatePropertyAll(Colors.grey[400]),
                      thumbColor: WidgetStatePropertyAll(randomColor),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(onTap: () {}, randomColor: randomColor),
            ],
          ),
        ),
      ),
    );
  }
}
