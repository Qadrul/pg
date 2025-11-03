import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final quiz = Provider.of<QuizProvider>(context);
    final question = questionList[quiz.currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soal ${quiz.currentQuestionIndex + 1}/${questionList.length}",
          style: const TextStyle(color: Color(0xFF1A2B4F)),
        ),
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
              QuestionCard(text: question.questionText),
              const SizedBox(height: 20),
              ...List.generate(question.options.length, (i) {
                return AnswerButton(
                  text: question.options[i],
                  isSelected: quiz.selectedIndex == i,
                  isCorrect: i == question.correctIndex,
                  isAnswered: quiz.answered,
                  onTap: () => quiz.answerQuestion(i),
                );
              }),
              const SizedBox(height: 30),
              if (quiz.answered)
                Text(
                  quiz.selectedIndex ==
                          questionList[quiz.currentQuestionIndex].correctIndex
                      ? "Correct.."
                      : "Wrong..",
                  style: TextStyle(
                    color: quiz.selectedIndex ==
                            questionList[quiz.currentQuestionIndex].correctIndex
                        ? Colors.green
                        : Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
