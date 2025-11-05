class Question {
  final String questionText;       // // Menyimpan teks pertanyaan (immutable)
  final List<String> options;      // // Menyimpan daftar pilihan jawaban
  final int correctIndex;          // // Menyimpan indeks jawaban yang benar

  Question({
    required this.questionText,
    required this.options,
    required this.correctIndex,
  });
}
