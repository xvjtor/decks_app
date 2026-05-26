// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeckStore on DeckStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'DeckStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$cardsAtom = Atom(name: 'DeckStoreBase.cards', context: context);

  @override
  ObservableList<Card> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<Card> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  late final _$addDeckAsyncAction =
      AsyncAction('DeckStoreBase.addDeck', context: context);

  @override
  Future<void> addDeck(String name) {
    return _$addDeckAsyncAction.run(() => super.addDeck(name));
  }

  late final _$getCardsAsyncAction =
      AsyncAction('DeckStoreBase.getCards', context: context);

  @override
  Future<void> getCards(String idDeck) {
    return _$getCardsAsyncAction.run(() => super.getCards(idDeck));
  }

  late final _$addNewCardAsyncAction =
      AsyncAction('DeckStoreBase.addNewCard', context: context);

  @override
  Future<void> addNewCard(
      {required String question,
      required String answers,
      required String idDeck}) {
    return _$addNewCardAsyncAction.run(() =>
        super.addNewCard(question: question, answers: answers, idDeck: idDeck));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
cards: ${cards}
    ''';
  }
}
