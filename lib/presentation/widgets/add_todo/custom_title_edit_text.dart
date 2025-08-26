import 'package:flutter/material.dart';

class CustomTitleEditText extends StatelessWidget {
  const CustomTitleEditText({
    required this.hint,
    super.key,
    this.errorMessage,
  });

  final String? errorMessage;
  final String hint;

  static const _errorStyle = TextStyle(
    color: Colors.red,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border(
              left: BorderSide(),
              top: BorderSide(),
              right: BorderSide(),
              bottom: BorderSide(width: 5),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: TextField(
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              cursorColor: Colors.black,
              cursorHeight: 18,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              ),
            ),
          ),
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 8),
          Text(errorMessage!, style: _errorStyle),
        ],
      ],
    );
  }
}
