import 'package:decks_app/core/injections.dart';
import 'package:decks_app/models/card_model.dart';
import 'package:decks_app/models/decks_model.dart';
import 'package:decks_app/pages/home_page.dart';

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(DecksAdapter());
  Hive.registerAdapter(CardAdapter());
}

/*void initServiceLocator() {
  GetIt.I.registerSingletonAsync(() async {
    final box = await Hive.openBox<List>("decks");
    return DeckRepository(boxDecks: box);
  });
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHive();

  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomePage());
  }
}
