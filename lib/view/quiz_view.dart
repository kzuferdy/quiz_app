import 'package:flutter/material.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends StatefulWidget {
  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final QuizController _controller = QuizController();
  final TextEditingController _usernameController = TextEditingController();
  bool _quizStarted = false;

  @override
  Widget build(BuildContext context) {
    if (!_quizStarted) {
      return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.yellow,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Masukkan Nama Pengguna",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    hintText: "Nama Pengguna",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.yellow, width: 2.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text.isNotEmpty) {
                      setState(() {
                        _quizStarted = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Mulai Kuis"),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final currentQuestion = _controller.viewModel.questions[_controller.viewModel.currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: Colors.redAccent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Skor: ${_controller.viewModel.score}",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (currentQuestion.questionText.length > 100) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Pertanyaan ${_controller.viewModel.currentQuestionIndex + 1}: ${currentQuestion.questionText}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ...currentQuestion.options.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String option = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ElevatedButton(
                        onPressed: _controller.viewModel.isQuestionLocked ? null : () {
                          setState(() {
                            _controller.selectOption(idx);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _controller.viewModel.selectedOptionIndex == idx
                              ? (_controller.viewModel.isAnswerCorrect
                                  ? Colors.green
                                  : Colors.red)
                              : Colors.deepPurple[200],
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        child: Text(option),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 20.0),
                  if (!_controller.viewModel.isQuestionLocked)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.lockAnswer();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent[400],
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      child: Text("Kunci Jawaban"),
                    ),
                  if (_controller.viewModel.isQuestionLocked)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.nextQuestion();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent[400],
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      child: Text("Lanjut"),
                    ),
                  if (_controller.viewModel.currentQuestionIndex == _controller.viewModel.questions.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Skor Akhir"),
                            content: Text("Nama Pengguna: ${_usernameController.text}\nSkor: ${_controller.viewModel.score}"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    _quizStarted = false;
                                    _controller.resetQuiz();
                                  });
                                },
                                child: Text(
                                  "Tutup",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[400],
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      child: Text("Lihat Skor Akhir"),
                    ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Pertanyaan ${_controller.viewModel.currentQuestionIndex + 1}: ${currentQuestion.questionText}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ...currentQuestion.options.asMap().entries.map((entry) {
                    int idx = entry.key;
                    String option = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ElevatedButton(
                        onPressed: _controller.viewModel.isQuestionLocked ? null : () {
                          setState(() {
                            _controller.selectOption(idx);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _controller.viewModel.selectedOptionIndex == idx
                              ? (_controller.viewModel.isAnswerCorrect
                                  ? Colors.green
                                  : Colors.red)
                              : Colors.deepPurple[200],
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        child: Text(option),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 20.0),
                  if (!_controller.viewModel.isQuestionLocked)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.lockAnswer();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent[400],
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: Text("Kunci Jawaban"),
                    ),
                  if (_controller.viewModel.isQuestionLocked)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controller.nextQuestion();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreenAccent[400],
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      child: Text("Lanjut"),
                    ),
                  if (_controller.viewModel.currentQuestionIndex == _controller.viewModel.questions.length - 1)
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Skor Akhir"),
                            content: Text("Nama Pengguna: ${_usernameController.text}\nSkor: ${_controller.viewModel.score}"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    _quizStarted = false;
                                    _controller.resetQuiz();
                                  });
                                },
                                child: Text(
                                  "Tutup",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue[400],
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow,
                        ),
                      ),
                      child: Text("Lihat Skor Akhir"),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}