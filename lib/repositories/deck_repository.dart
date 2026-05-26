import 'package:decks_app/models/card_model.dart';
import 'package:decks_app/models/decks_model.dart';
import 'package:hive_flutter/adapters.dart';

class DeckRepository {
  final Box<List> boxDecks;

  DeckRepository({required this.boxDecks});

  Future<List<Decks>> getAllDecks() async {
    final decks = boxDecks.get("decks", defaultValue: [])!;

    return List<Decks>.from(decks);
  }

  Future<void> addNewDeck(Decks deck) async {
    final decks = boxDecks.get("decks", defaultValue: [])!;

    await Future.delayed(const Duration(seconds: 2));
    decks.add(deck);

    await boxDecks.put("decks", decks);
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> removeDeck(String idDeck) async {
    final decks = await getAllDecks();

    decks.removeWhere((deck) => deck.id == idDeck);

    await boxDecks.put("decks", decks);
  }

  Future<void> addNewCard({required String idDeck, required Card card}) async {
    final decks = await getAllDecks();

    final deck = decks.firstWhere((deck) => deck.id == idDeck);

    deck.cards.add(card);

    await boxDecks.put("decks", decks);
  }

  Future<List<Card>> getCards(String idDeck) async {
    final decks = await getAllDecks();

    final deck = decks.firstWhere((deck) => deck.id == idDeck);

    return List<Card>.from(deck.cards);
  }
}
