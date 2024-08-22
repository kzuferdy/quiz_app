import '../models/questions_model.dart';

class QuizViewModel {
  final List<Question> _questions = [
    Question(questionText: "Pancasila sebagai dasar negara memiliki peran penting dalam menjaga keutuhan bangsa. Di tengah maraknya isu intoleransi, nilai-nilai Pancasila yang mana yang paling relevan dalam mengatasi permasalahan tersebut?", options: ["Persatuan Indonesia", "Keadilan sosial bagi seluruh rakyat Indonesia", " Ketuhanan yang Maha Esa", "Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan"], correctOptionIndex: 0),
    Question(questionText: "Bonus demografi yang dialami Indonesia diperkirakan akan mencapai puncaknya pada tahun 2030. Apa langkah strategis yang dapat dilakukan pemerintah untuk memaksimalkan potensi bonus demografi ini?", options: ["Meningkatkan anggaran belanja militer", "Mengembangkan sektor pendidikan dan pelatihan keterampilan", "Memperluas jaringan transportasi nasional", "Mengurangi angka ekspor tenaga kerja"], correctOptionIndex: 1),
    Question(questionText: "Sebagai negara dengan posisi geografis yang strategis, Indonesia memiliki peluang besar dalam sektor maritim. Namun, apa tantangan utama yang harus dihadapi dalam memanfaatkan peluang ini?", options: ["Kurangnya tenaga kerja terampil di sektor maritim", "Ketidakstabilan politik regional", "Ketergantungan pada impor bahan baku industri maritim", "Terbatasnya investasi asing di sektor kelautan"], correctOptionIndex: 0),
    Question(questionText: "Keragaman budaya Indonesia merupakan salah satu kekuatan bangsa. Namun, apa yang harus dilakukan untuk menjaga harmoni di tengah perbedaan tersebut?", options: ["Menghapuskan perbedaan budaya agar tercipta keseragaman", "Meningkatkan pengawasan terhadap budaya asing", " Mengisolasi kelompok-kelompok yang berbeda budaya", "Dalam konteks pengembangan sumber daya manusia, sektor manakah yang harus menjadi prioritas untuk meningkatkan daya saing global Indonesia?"], correctOptionIndex: 3),
    Question(questionText: "Dalam konteks pengembangan sumber daya manusia, sektor manakah yang harus menjadi prioritas untuk meningkatkan daya saing global Indonesia?", options: ["Pertanian dan perikanan", "Pariwisata dan budaya", "Teknologi informasi dan komunikasi", "Energi dan sumber daya alam"], correctOptionIndex: 2),
    Question(questionText: "Militer Indonesia memiliki peran penting dalam menjaga kedaulatan negara. Strategi pertahanan apa yang dapat memperkuat keamanan nasional tanpa memicu ketegangan regional?", options: ["Peningkatan kerjasama pertahanan dengan negara adidaya", "Peningkatan diplomasi pertahanan dan kerjasama regional", "Pengembangan teknologi persenjataan massal", "Memperkuat kehadiran militer di seluruh wilayah perbatasan"], correctOptionIndex: 1),
    Question(questionText: "Keragaman etnis di Indonesia sering kali dihadapkan pada tantangan dalam menjaga persatuan nasional. Bagaimana pemerintah dapat mencegah konflik etnis tanpa mengabaikan keunikan budaya lokal?", options: ["PerMempromosikan dialog lintas budaya dan memperkuat pendidikan tentang kebhinekaan", "Menyediakan otonomi khusus untuk semua daerah di Indonesia", "Menerapkan hukum yang lebih ketat terhadap pelanggaran hak asasi manusia", " Melarang perayaan budaya lokal yang berbeda dari mayoritas"], correctOptionIndex: 0),
    Question(questionText: "Dalam rangka memanfaatkan bonus demografi, Indonesia perlu meningkatkan kualitas sumber daya manusianya. Program apa yang paling efektif untuk mencapai tujuan ini?", options: ["Peningkatan anggaran militer", "Peningkatan investasi dalam infrastruktur", "Penurunan angka pertumbuhan penduduk", "Program pendidikan vokasi dan pelatihan kerja"], correctOptionIndex: 3),
    Question(questionText: "Posisi geografis Indonesia di Asia Tenggara memberikan peluang dalam perdagangan internasional. Namun, bagaimana Indonesia dapat meningkatkan daya saingnya di pasar global?", options: ["Meningkatkan proteksi terhadap industri lokal", "Mengurangi ekspor barang mentah", "Meningkatkan kualitas produk ekspor dan efisiensi logistik", "Menurunkan nilai tukar mata uang"], correctOptionIndex: 2),
    Question(questionText: "Pemerintah Indonesia terus berupaya meningkatkan kesejahteraan masyarakat melalui pembangunan berkelanjutan. Faktor lingkungan apa yang harus dipertimbangkan untuk menjaga keberlanjutan tersebut?", options: ["Mengurangi regulasi terhadap perusahaan tambang", "Mengembangkan energi terbarukan dan konservasi sumber daya alam", "Meningkatkan penebangan hutan untuk lahan pertanian", "Mengalihkan fokus pembangunan ke sektor industri berat"], correctOptionIndex: 1),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedOptionIndex;
  bool _isAnswerCorrect = false;
  bool _isQuestionLocked = false;

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  bool get isAnswerCorrect => _isAnswerCorrect;
  int? get selectedOptionIndex => _selectedOptionIndex;
  bool get isQuestionLocked => _isQuestionLocked;

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _selectedOptionIndex = null;
      _isAnswerCorrect = false;
      _isQuestionLocked = false;
    }
  }

  void selectOption(int selectedOptionIndex) {
    _selectedOptionIndex = selectedOptionIndex;
  }

  void lockAnswer() {
    if (_isQuestionLocked || _selectedOptionIndex == null) return;

    if (_selectedOptionIndex == _questions[_currentQuestionIndex].correctOptionIndex) {
      _score += 10;
      _isAnswerCorrect = true;
    } else {
      _isAnswerCorrect = false;
    }
    _isQuestionLocked = true;
  }

  void reset() {
    _currentQuestionIndex = 0;
    _score = 0;
    _selectedOptionIndex = null;
    _isAnswerCorrect = false;
    _isQuestionLocked = false;
  }
}
