import 'package:decks_app/models/card_model.dart';
import 'package:decks_app/models/decks_model.dart';
import 'package:decks_app/repositories/deck_repository.dart';
import 'package:decks_app/stores/home_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'deck_store.g.dart';

class DeckStore = DeckStoreBase with _$DeckStore;

abstract class DeckStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<Card> cards = <Card>[].asObservable();

  @action
  Future<void> addDeck(String name) async {
    isLoading = true;

    final repository = GetIt.I.get<DeckRepository>();

    await repository.addNewDeck(
      Decks(name: name, id: DateTime.now().microsecond.toString()),
    );

    isLoading = false;
  }

  @action
  Future<void> getCards(String idDeck) async {
    isLoading = true;

    final repository = GetIt.I.get<DeckRepository>();

    final cardsTemp = await repository.getCards(idDeck);

    cards = cardsTemp.asObservable();

    isLoading = false;
  }

  @action
  Future<void> addNewCard({
    required String question,
    required String answers,
    required String idDeck,
  }) async {
    final repository = GetIt.I.get<DeckRepository>();
    final homeStore = GetIt.I.get<HomeStore>();

    final card = Card(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      question: question,
      answers: answers,
    );

    await repository.addNewCard(idDeck: idDeck, card: card);

    await getCards(idDeck);
    await homeStore.getDecks();

    
  }
}
