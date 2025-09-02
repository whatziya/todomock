import 'package:flutter/material.dart';

enum TimeWidgetType { hour, minute }

class TimeWidget extends StatefulWidget {
  final TextEditingController controller;
  final TimeWidgetType timeWidgetType;

  const TimeWidget({required this.controller, required this.timeWidgetType, super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  int get _maxValue => widget.timeWidgetType == TimeWidgetType.hour ? 23 : 59;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validateInput);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validateInput);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
        border: Border(
          left: BorderSide(),
          top: BorderSide(),
          right: BorderSide(),
          bottom: BorderSide(width: 5),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: TextField(
              controller: widget.controller,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              cursorColor: Colors.black,
              cursorHeight: 18,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _incrementTime,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: const Icon(Icons.arrow_drop_up),
              ),
              InkWell(
                onTap: _decrementTime,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: const Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  void _validateInput() {
    final text = widget.controller.text;
    if (text.isEmpty) return;

    final parsed = int.tryParse(text);
    if (parsed == null) {
      _setFormattedValue(0);
      return;
    }

    final clampedValue = parsed.clamp(0, _maxValue);
    final formatted = clampedValue.toString().padLeft(2, '0');

    if (text != formatted) {
      _setFormattedValue(clampedValue);
    }
  }

  void _incrementTime() {
    final currentValue = int.tryParse(widget.controller.text) ?? 0;
    final newValue = (currentValue + 1) > _maxValue ? 0 : currentValue + 1;
    _setFormattedValue(newValue);
  }

  void _decrementTime() {
    final currentValue = int.tryParse(widget.controller.text) ?? 0;
    final newValue = (currentValue - 1) < 0 ? _maxValue : currentValue - 1;
    _setFormattedValue(newValue);
  }

  void _setFormattedValue(int value) {
    final formatted = value.toString().padLeft(2, '0');
    widget.controller.text = formatted;
    widget.controller.selection = TextSelection.collapsed(offset: formatted.length);
  }
}
