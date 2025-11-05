import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String text;
  final TextStyle? textStyle; // <-- tambahkan ini

  const QuestionCard({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ??
            const TextStyle(
              fontSize: 18,
              color: Color(0xFF1A2B4F),
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
