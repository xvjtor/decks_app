
import 'package:decks_app/repositories/deck_repository.dart';
import 'package:decks_app/stores/deck_store.dart';
import 'package:decks_app/stores/home_store.dart';
import 'package:decks_app/stores/quiz_store.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final boxDecks = await Hive.openBox<List>("decks");
  

  getIt.registerSingleton<DeckRepository>(DeckRepository(boxDecks: boxDecks));
  getIt.registerSingleton<DeckStore>(DeckStore());
  getIt.registerSingleton<HomeStore>(HomeStore());
  getIt.registerSingleton<QuizStore>(QuizStore());
}
