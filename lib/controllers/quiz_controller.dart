import '../view_models/quiz_view_model.dart';

class QuizController {
  final QuizViewModel _viewModel = QuizViewModel();

  QuizViewModel get viewModel => _viewModel;

  void selectOption(int index) {
    _viewModel.selectOption(index);
  }

  void lockAnswer() {
    _viewModel.lockAnswer();
  }

  void nextQuestion() {
    _viewModel.nextQuestion();
  }

  void resetQuiz() {
    _viewModel.reset();
  }
}
