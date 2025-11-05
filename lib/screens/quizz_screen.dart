import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pg/widgets/theme_toogle_icon.dart';
import 'package:provider/provider.dart';
import 'package:pg/data/question_data.dart';
import 'package:pg/providers/quiz_provider.dart';
import 'package:pg/widgets/answer_button.dart';
import 'package:pg/widgets/next_button.dart';
import 'package:pg/widgets/question_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context); // Akses QuizProvider
    final question = quiz.shuffledQuestions[quiz.currentQuestionIndex]; // Ambil pertanyaan saat ini
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soal ${quiz.currentQuestionIndex + 1}/${questionList.length}", // Indikator progres
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500, // Medium untuk judul
            color: theme.colorScheme.onSurface,
          ),
        ),
        actions: const [ThemeToggleIcon()],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuestionCard(
                text: question.questionText,
                textStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400, // Regular untuk pertanyaan
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(question.options.length, (i) {
                return AnswerButton(
                  text: question.options[i],
                  isSelected: quiz.selectedIndex == i,
                  isCorrect: i == question.correctIndex,
                  isAnswered: quiz.answered,
                  onTap: () => quiz.answerQuestion(i),
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400, // Regular untuk jawaban
                  ),
                );
              }),
              const SizedBox(height: 30),
              if (quiz.answered)
                Text(
                  quiz.selectedIndex == question.correctIndex
                      ? "Correct.."
                      : "Wrong..",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500, // Medium untuk feedback
                    color: quiz.selectedIndex == question.correctIndex
                        ? Colors.green
                        : Colors.red,
                    fontSize: 18,
                  ),
                ),
              const SizedBox(height: 10),
              NextButton(
                onPressed: () {
                  if (quiz.isLastQuestion) {
                    context.go('/result');
                  } else {
                    quiz.nextQuestion();
                  }
                },
                textStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400, // Regular untuk tombol next
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: quiz.confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              numberOfParticles: 15,
              gravity: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
