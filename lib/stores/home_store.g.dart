// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$decksAtom = Atom(name: 'HomeStoreBase.decks', context: context);

  @override
  ObservableList<Decks> get decks {
    _$decksAtom.reportRead();
    return super.decks;
  }

  @override
  set decks(ObservableList<Decks> value) {
    _$decksAtom.reportWrite(value, super.decks, () {
      super.decks = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

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

  late final _$getDecksAsyncAction =
      AsyncAction('HomeStoreBase.getDecks', context: context);

  @override
  Future<void> getDecks() {
    return _$getDecksAsyncAction.run(() => super.getDecks());
  }

  late final _$removeDeckAsyncAction =
      AsyncAction('HomeStoreBase.removeDeck', context: context);

  @override
  Future<void> removeDeck(String idDeck) {
    return _$removeDeckAsyncAction.run(() => super.removeDeck(idDeck));
  }

  @override
  String toString() {
    return '''
decks: ${decks},
isLoading: ${isLoading}
    ''';
  }
}
