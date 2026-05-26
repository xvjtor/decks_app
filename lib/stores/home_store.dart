import 'package:decks_app/models/decks_model.dart';
import 'package:decks_app/repositories/deck_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<Decks> decks = <Decks>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  Future<void> getDecks() async {
    isLoading = true;

    final repository = GetIt.I.get<DeckRepository>();

    await Future.delayed(const Duration(seconds: 1));

    decks = (await repository.getAllDecks()).asObservable();

    isLoading = false;
  }

  @action
  Future<void> removeDeck(String idDeck) async {
    final repository = GetIt.I.get<DeckRepository>();

    await repository.removeDeck(idDeck);
    decks.removeWhere((deck) => deck.id == idDeck);
  }
}
