import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pg/providers/quiz_provider.dart';
import 'package:pg/data/question_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil", style: TextStyle(color: Color(0xFF1A2B4F))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Terima kasih, ${quiz.userName}!",
                style: const TextStyle(
                    fontSize: 20, color: Color(0xFF1A2B4F), fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                "Skor kamu ${quiz.score}/${questionList.length}",
                style: const TextStyle(color: Color(0xFF6B7BA3)),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  quiz.resetQuiz();
                  context.go('/quiz');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F6DFF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Ulangi (${quiz.userName})"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  quiz.resetQuiz();
                  context.go('/name');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2F6DFF),
                  side: const BorderSide(color: Color(0xFF2F6DFF)),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("HOME"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
