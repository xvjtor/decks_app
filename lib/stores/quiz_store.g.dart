// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizStore on QuizStoreBase, Store {
  Computed<bool>? _$finishedQuizComputed;

  @override
  bool get finishedQuiz =>
      (_$finishedQuizComputed ??= Computed<bool>(() => super.finishedQuiz,
              name: 'QuizStoreBase.finishedQuiz'))
          .value;

  late final _$currentIndexAtom =
      Atom(name: 'QuizStoreBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$showAnswerAtom =
      Atom(name: 'QuizStoreBase.showAnswer', context: context);

  @override
  bool get showAnswer {
    _$showAnswerAtom.reportRead();
    return super.showAnswer;
  }

  @override
  set showAnswer(bool value) {
    _$showAnswerAtom.reportWrite(value, super.showAnswer, () {
      super.showAnswer = value;
    });
  }

  late final _$scoreAtom = Atom(name: 'QuizStoreBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$totalCardsAtom =
      Atom(name: 'QuizStoreBase.totalCards', context: context);

  @override
  int get totalCards {
    _$totalCardsAtom.reportRead();
    return super.totalCards;
  }

  @override
  set totalCards(int value) {
    _$totalCardsAtom.reportWrite(value, super.totalCards, () {
      super.totalCards = value;
    });
  }

  late final _$QuizStoreBaseActionController =
      ActionController(name: 'QuizStoreBase', context: context);

  @override
  void correctAnswer() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
        name: 'QuizStoreBase.correctAnswer');
    try {
      return super.correctAnswer();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void wrongAnswer() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
        name: 'QuizStoreBase.wrongAnswer');
    try {
      return super.wrongAnswer();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCard() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
        name: 'QuizStoreBase.toggleCard');
    try {
      return super.toggleCard();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
showAnswer: ${showAnswer},
score: ${score},
totalCards: ${totalCards},
finishedQuiz: ${finishedQuiz}
    ''';
  }
}
