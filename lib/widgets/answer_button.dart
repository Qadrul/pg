import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;
  final VoidCallback onTap;
  final TextStyle? textStyle; // <-- tambahkan ini

  const AnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
    required this.onTap,
    this.textStyle, // <-- tambahkan ini
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.white;
    if (isAnswered && isSelected) {
      bgColor = isCorrect ? Colors.green : Colors.red;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: textStyle ?? const TextStyle(), // <-- pakai style dari screen
        ),
      ),
    );
  }
}
