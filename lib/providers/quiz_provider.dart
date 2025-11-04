import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:pg/data/question_data.dart';
import 'package:pg/models/question_models.dart';

class QuizProvider extends ChangeNotifier {
  String userName = '';
  int currentQuestionIndex = 0;
  int score = 0;
  bool answered = false;
  int? selectedIndex;
  late List<Question> shuffledQuestions;

  final ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 1));

  QuizProvider() {
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    shuffledQuestions = List<Question>.from(questionList)..shuffle(Random());
  }

  void setName(String name) {
    userName = name;
    _shuffleQuestions(); // acak ulang setiap kali mulai quiz
    resetQuiz();
    notifyListeners();
  }

  void answerQuestion(int index) {
    if (answered) return;
    answered = true;
    selectedIndex = index;

    // Hitung skor langsung tanpa menunggu confetti
    if (index == shuffledQuestions[currentQuestionIndex].correctIndex) {
      score++;
      confettiController.play();
    }

    notifyListeners();
  }

  void nextQuestion() {
    if (currentQuestionIndex < shuffledQuestions.length - 1) {
      currentQuestionIndex++;
      answered = false;
      selectedIndex = null;
      notifyListeners();
    }
  }

  bool get isLastQuestion => currentQuestionIndex == shuffledQuestions.length - 1;

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
