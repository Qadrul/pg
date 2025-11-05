import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:pg/data/question_data.dart';
import 'package:pg/models/question_models.dart';

class QuizProvider extends ChangeNotifier {
  String userName = '';                       // // Menyimpan nama pengguna
  int currentQuestionIndex = 0;               // // Menyimpan indeks pertanyaan saat ini
  int score = 0;                              // // Menyimpan skor pengguna
  bool answered = false;                      // // Menandai apakah pertanyaan sudah dijawab
  int? selectedIndex;                         // // Menyimpan jawaban yang dipilih
  late List<Question> shuffledQuestions;      // // List pertanyaan acak untuk quiz

  final ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 1));  // // Controller animasi confetti

  QuizProvider() {
    _shuffleQuestions();                      // // Acak pertanyaan saat provider dibuat
  }

  void _shuffleQuestions() {
    shuffledQuestions = List<Question>.from(questionList)..shuffle(Random());
  }

  void setName(String name) {
    userName = name;
    _shuffleQuestions();                      // // Acak ulang setiap kali quiz baru
    resetQuiz();
    notifyListeners();                        // // Update UI via state management
  }

  void answerQuestion(int index) {
    if (answered) return;                      // // Mencegah jawaban ganda
    answered = true;
    selectedIndex = index;

    if (index == shuffledQuestions[currentQuestionIndex].correctIndex) {
      score++;                                 // // Hitung skor
      confettiController.play();              // // Mainkan animasi confetti
    }

    notifyListeners();                        // // Update UI
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
    confettiController.dispose();             // // Bersihkan controller saat provider dibuang
    super.dispose();
  }
}
