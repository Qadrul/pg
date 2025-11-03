import 'package:flutter/material.dart';
import 'package:pg/data/question_data.dart';
import 'package:confetti/confetti.dart';

class QuizProvider extends ChangeNotifier {
  String userName = '';
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;
  int? selectedIndex;
  final ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 1));

  void setName(String name) {
    userName = name;
    notifyListeners();
  }

  void answerQuestion(int index) {
    if (answered) return;
    answered = true;
    selectedIndex = index;

    if (index == questionList[currentQuestionIndex].correctIndex) {
      score++;
      confettiController.play();
    }

    notifyListeners();
  }

  void nextQuestion() {
    if (currentQuestionIndex < questionList.length - 1) {
      currentQuestionIndex++;
      answered = false;
      selectedIndex = null;
      notifyListeners();
    }
  }

  bool get isLastQuestion => currentQuestionIndex == questionList.length - 1;

  void resetQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    answered = false;
    selectedIndex = null;
    notifyListeners();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }
}
