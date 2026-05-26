import 'package:mobx/mobx.dart';

part 'quiz_store.g.dart';

class QuizStore = QuizStoreBase with _$QuizStore;

abstract class QuizStoreBase with Store {
  @observable
  int currentIndex = 0;

  @observable
  bool showAnswer = false;

  @observable
  int score = 0;

  @observable
  int totalCards = 0;

  @computed
  bool get finishedQuiz {
    return currentIndex >= totalCards;
    
  }

  @action
  void correctAnswer() {
    score++;

    currentIndex++;

    showAnswer = false;
  }

  @action
  void wrongAnswer() {
    currentIndex++;

    showAnswer = false;
  }

  @action
  void toggleCard() {
    showAnswer = !showAnswer;
  }
}
