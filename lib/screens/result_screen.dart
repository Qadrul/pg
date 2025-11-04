import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pg/widgets/theme_toogle_icon.dart';
import 'package:provider/provider.dart';
import 'package:pg/providers/quiz_provider.dart';
import 'package:pg/data/question_data.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context, listen: false);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hasil",
          style: TextStyle(color: theme.colorScheme.onBackground),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [ThemeToggleIcon()],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Terima kasih, ${quiz.userName}!",
                style: TextStyle(
                  fontSize: 20,
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Skor kamu ${quiz.score}/${questionList.length}",
                style: TextStyle(color: theme.colorScheme.secondary),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  quiz.resetQuiz();
                  context.go('/quiz');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
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
                  backgroundColor: theme.colorScheme.surface,
                  foregroundColor: theme.colorScheme.primary,
                  side: BorderSide(color: theme.colorScheme.primary),
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
