import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onTap,
    required this.randomColor,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback? onTap;
  final Color randomColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null || isLoading;

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Material(
        color: isDisabled ? randomColor.withValues(alpha: 0.6) : randomColor,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: isDisabled ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isLoading
                  ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
                  : const Text(
                'Create task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
