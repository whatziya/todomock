import 'package:flutter/material.dart';

enum TimeWidgetType {
  hour,
  minute,
}

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    required this.controller,
    required this.timeWidgetType,
    super.key,
    this.errorMessage,
  });

  final TextEditingController controller;
  final String? errorMessage;
  final TimeWidgetType timeWidgetType;

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  static const _errorStyle = TextStyle(
    color: Colors.red,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

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

  void _validateInput() {
    final text = widget.controller.text;
    if (text.isEmpty) return;

    final parsed = int.tryParse(text);
    if (parsed == null) {
      widget.controller.text = '00';
      widget.controller.selection = const TextSelection.collapsed(offset: 2);
      return;
    }

    final value = parsed.clamp(0, _maxValue);
    final formatted = value.toString().padLeft(2, '0');

    if (text != formatted) {
      widget.controller.text = formatted;
      widget.controller.selection = const TextSelection.collapsed(offset: 2);
    }
  }

  void _increaseTime() {
    var value = int.tryParse(widget.controller.text) ?? 0;
    value = (value + 1) > _maxValue ? 0 : value + 1;
    widget.controller.text = value.toString().padLeft(2, '0');
  }

  void _decreaseTime() {
    var value = int.tryParse(widget.controller.text) ?? 0;
    value = (value - 1) < 0 ? _maxValue : value - 1;
    widget.controller.text = value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          decoration:
              BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(),
              ).copyWith(
                border: const Border(
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
                    onTap: _increaseTime,
                    borderRadius: BorderRadius.circular(20),
                    child: const Icon(Icons.arrow_drop_up),
                  ),
                  InkWell(
                    onTap: _decreaseTime,
                    borderRadius: BorderRadius.circular(20),
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
        if (widget.errorMessage != null) ...[
          const SizedBox(height: 8),
          Text(widget.errorMessage!, style: _errorStyle),
        ],
      ],
    );
  }
}
