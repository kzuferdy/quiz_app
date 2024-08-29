import '../models/questions_model.dart';

class QuizViewModel {
  final List<Question> _questions = [
    Question(questionText: "Pancasila sebagai dasar negara memiliki peran penting dalam menjaga keutuhan bangsa. Di tengah maraknya isu intoleransi, nilai-nilai Pancasila yang mana yang paling relevan dalam mengatasi permasalahan tersebut?", options: ["Persatuan Indonesia", "Keadilan sosial bagi seluruh rakyat Indonesia", " Ketuhanan yang Maha Esa", "Kerakyatan yang dipimpin oleh hikmat kebijaksanaan dalam permusyawaratan/perwakilan"], correctOptionIndex: 0, image: "assets/images/rusdan1.png"),
    Question(questionText: "Bonus demografi yang dialami Indonesia diperkirakan akan mencapai puncaknya pada tahun 2030. Apa langkah strategis yang dapat dilakukan pemerintah untuk memaksimalkan potensi bonus demografi ini?", options: ["Meningkatkan anggaran belanja militer", "Mengembangkan sektor pendidikan dan pelatihan keterampilan", "Memperluas jaringan transportasi nasional", "Mengurangi angka ekspor tenaga kerja"], correctOptionIndex: 1),
    Question(questionText: "Sebagai negara dengan posisi geografis yang strategis, Indonesia memiliki peluang besar dalam sektor maritim. Namun, apa tantangan utama yang harus dihadapi dalam memanfaatkan peluang ini?", options: ["Kurangnya tenaga kerja terampil di sektor maritim", "Ketidakstabilan politik regional", "Ketergantungan pada impor bahan baku industri maritim", "Terbatasnya investasi asing di sektor kelautan"], correctOptionIndex: 0),
    Question(questionText: "Keragaman budaya Indonesia merupakan salah satu kekuatan bangsa. Namun, apa yang harus dilakukan untuk menjaga harmoni di tengah perbedaan tersebut?", options: ["Menghapuskan perbedaan budaya agar tercipta keseragaman", "Meningkatkan pengawasan terhadap budaya asing", " Mengisolasi kelompok-kelompok yang berbeda budaya", "Dalam konteks pengembangan sumber daya manusia, sektor manakah yang harus menjadi prioritas untuk meningkatkan daya saing global Indonesia?"], correctOptionIndex: 3),
    Question(questionText: "Dalam konteks pengembangan sumber daya manusia, sektor manakah yang harus menjadi prioritas untuk meningkatkan daya saing global Indonesia?", options: ["Pertanian dan perikanan", "Pariwisata dan budaya", "Teknologi informasi dan komunikasi", "Energi dan sumber daya alam"], correctOptionIndex: 2),
    Question(questionText: "Militer Indonesia memiliki peran penting dalam menjaga kedaulatan negara. Strategi pertahanan apa yang dapat memperkuat keamanan nasional tanpa memicu ketegangan regional?", options: ["Peningkatan kerjasama pertahanan dengan negara adidaya", "Peningkatan diplomasi pertahanan dan kerjasama regional", "Pengembangan teknologi persenjataan massal", "Memperkuat kehadiran militer di seluruh wilayah perbatasan"], correctOptionIndex: 1),
    Question(questionText: "Keragaman etnis di Indonesia sering kali dihadapkan pada tantangan dalam menjaga persatuan nasional. Bagaimana pemerintah dapat mencegah konflik etnis tanpa mengabaikan keunikan budaya lokal?", options: ["PerMempromosikan dialog lintas budaya dan memperkuat pendidikan tentang kebhinekaan", "Menyediakan otonomi khusus untuk semua daerah di Indonesia", "Menerapkan hukum yang lebih ketat terhadap pelanggaran hak asasi manusia", " Melarang perayaan budaya lokal yang berbeda dari mayoritas"], correctOptionIndex: 0),
    Question(questionText: "Dalam rangka memanfaatkan bonus demografi, Indonesia perlu meningkatkan kualitas sumber daya manusianya. Program apa yang paling efektif untuk mencapai tujuan ini?", options: ["Peningkatan anggaran militer", "Peningkatan investasi dalam infrastruktur", "Penurunan angka pertumbuhan penduduk", "Program pendidikan vokasi dan pelatihan kerja"], correctOptionIndex: 3),
    Question(questionText: "Posisi geografis Indonesia di Asia Tenggara memberikan peluang dalam perdagangan internasional. Namun, bagaimana Indonesia dapat meningkatkan daya saingnya di pasar global?", options: ["Meningkatkan proteksi terhadap industri lokal", "Mengurangi ekspor barang mentah", "Meningkatkan kualitas produk ekspor dan efisiensi logistik", "Menurunkan nilai tukar mata uang"], correctOptionIndex: 2),
    Question(questionText: "Pemerintah Indonesia terus berupaya meningkatkan kesejahteraan masyarakat melalui pembangunan berkelanjutan. Faktor lingkungan apa yang harus dipertimbangkan untuk menjaga keberlanjutan tersebut?", options: ["Mengurangi regulasi terhadap perusahaan tambang", "Mengembangkan energi terbarukan dan konservasi sumber daya alam", "Meningkatkan penebangan hutan untuk lahan pertanian", "Mengalihkan fokus pembangunan ke sektor industri berat"], correctOptionIndex: 1),
    Question(questionText: "Berdasarkan artikel di atas, manakah dari kegiatan berikut yang merupakan contoh penerapan nilai Persatuan Indonesia di Desa Cerdas", options: ["Mendirikan koperasi desa yang dikelola bersama oleh warga", "Mengadakan kerja bakti membersihkan lingkungan desa ", "Mengadakan pertemuan bulanan untuk membahas masalah desa", "Menghormati perbedaan agama dalam kegiatan sehari-hari"], correctOptionIndex: 1, image: "assets/images/11.png"),
    Question(questionText: "Berdasarkan artikel di atas, semua warga Desa Cerdas, tanpa memandang agama atau status sosial, memiliki hak yang sama untuk menyampaikan pendapat dalam pertemuan musyawarah desa", options: ["Benar", "Salah"], correctOptionIndex: 0, image: "assets/images/11.png"),
    Question(questionText: "Di Desa Cerdas, penduduk yang beragama Kristen dan Hindu tidak diikutsertakan dalam musyawarah desa karena mayoritas penduduknya beragama Islam.", options: ["Benar", "Salah"], correctOptionIndex: 1, image: "assets/images/11.png"),
    Question(questionText: "Bagaimana kekuatan geografis Indonesia sebagai negara besar dapat mempengaruhi potensi investasi dari berbagai pihak?", options: ["regional Geografis yang luas membuat distribusi investasi menjadi sulit dan kurang menarik.", "Lokasi strategis Indonesia sebagai negara besar memudahkan akses ke pasar dan internasional, meningkatkan daya tarik investasi.", "Geografis yang luas menyebabkan masalah logistik yang menghambat pertumbuhan investasi", "Negara besar cenderung memiliki lebih banyak konflik internal yang mengurangi minat investasi."], correctOptionIndex: 1,),
    Question(questionText: "Bagaimana kemajuan ilmu pengetahuan dan teknologi dapat membantu mengatasi tantangan individualisme di Indonesia? ", options: ["Dengan mempromosikan teknologi yang hanya berfokus pada keuntungan pribadi", "Dengan meningkatkan individualisme melalui akses ke teknologi yang mendorong privasi ekstrem", "Dengan menyediakan platform untuk kolaborasi dan pertukaran informasi yang memperkuat rasa komunitas dan kerjasama","Dengan memperkenalkan teknologi yang memperkuat kesenjangan sosial"], correctOptionIndex: 2),
    Question(questionText: "Manakah dari berikut ini yang dapat dianggap sebagai pelanggaran terhadap nilai-nilai Pancasila dalam konteks kehidupan masyarakat?", options: ["Melaksanakan program pemberdayaan masyarakat secara transparan dan inklusif", "Menyebarkan informasi yang tidak akurat dan berpotensi menimbulkan konflik","Menghormati hak-hak minoritas dan menghargai keragaman","Berpartisipasi dalam dialog terbuka untuk penyelesaian masalah sosial"], correctOptionIndex: 1,),
    Question(questionText: "Seorang siswa dalam diskusi berpendapat bahwa Pancasila adalah satu-satunya ideologi terbaik bagi bangsa. Berdasarkan data infografis, berapa persentase masyarakat yang setuju dengan pendapat ini?", options: ["95,8%", "2,7%", "38,7%", "54,4%"], correctOptionIndex: 0, image: "assets/images/16.png"),
    Question(questionText: "Dalam survei Pancasila in Action mayoritas siswa mengatakan bahwa mereka masih menerapkan nilai-nilai Pancasila dalam kehidupan sehari-hari. Berdasarkan data dari infografis, berapa persentase masyarakat umum yang juga menyatakan bahwa nilai-nilai Pancasila masih diterapkan?", options: ["38,7%", "58,2%", "23,9%", "19,4%"], correctOptionIndex: 1, image: "assets/images/18.png"),
    Question(questionText: "Penduduk Indonesia mencapai lebih dari 270 juta jiwa, dan saat ini Indonesia menempati peringkat keempat negara dengan jumlah penduduk terbesar di dunia. Urutkan negara-negara berikut berdasarkan jumlah penduduknya dari yang terbanyak hingga yang paling sedikit", options: ["Amerika Serikat, Indonesia, China, India", "China, India, Indonesia, Amerika Serikat", "China, India, Amerika Serikat, Indonesia", "India, China, Indonesia, Amerika Serikat"], correctOptionIndex: 2, image: "assets/images/19.png"),
    Question(questionText: "Dengan asumsi total penduduk Indonesia tidak berubah, berapa jumlah penduduk Indonesia yang diproyeksikan akan menjadi kelas berpendapatan menengah pada tahun 2030 jika persentasenya mencapai 49%", options: ["121,5 juta", "132,3 juta", "144,3 juta", "158,7 juta"], correctOptionIndex: 3),
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
      _score += 5;
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
