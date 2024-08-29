class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final String? image; // Properti opsional untuk menyimpan path gambar

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    this.image,
  });
}
