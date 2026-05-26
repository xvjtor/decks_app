import 'package:decks_app/core/colors.dart';
import 'package:decks_app/core/injections.dart';
import 'package:decks_app/models/decks_model.dart';
import 'package:decks_app/pages/card_form_page.dart';
import 'package:decks_app/pages/quiz_page.dart';

import 'package:decks_app/stores/deck_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DeckDetailsPage extends StatefulWidget {
  final Decks deck;
  final store = getIt.get<DeckStore>();

  DeckDetailsPage({super.key, required this.deck}) {
    store.getCards(deck.id);
  }

  @override
  State<DeckDetailsPage> createState() => _DeckDetailsPageState();
}

class _DeckDetailsPageState extends State<DeckDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          key: Key("btnvoltar"),
          onPressed: () => Navigator.of(context).pop(),
        ),

        title: Text(widget.deck.name, style: TextStyle(color: secondColor)),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: secondColor,
      ),
      body: Observer(
        builder: (context) {
          return Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.deck.name, style: TextStyle(fontSize: 40)),

                SizedBox(height: 20),

                Text(
                  "${widget.store.cards.length} cartões",
                  style: TextStyle(fontSize: 25),
                ),

                SizedBox(height: 200),

                addCardButton(context, widget.deck),

                SizedBox(height: 20),

                startQuizButton(context, widget.deck),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore: strict_top_level_inference
Widget addCardButton(context, Decks deck) {
  return SizedBox(
    width: 240,
    height: 60,
    child: TextButton(
      key: Key("addCard"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CardFormPage(deck: deck)),
        );
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: primaryColor),
        ),
      ),
      child: Text(
        "Add Cartão",
        style: TextStyle(fontSize: 18, color: primaryColor),
      ),
    ),
  );
}

// ignore: strict_top_level_inference
Widget startQuizButton(context, Decks deck) {
  final deckStore = getIt.get<DeckStore>();

  return SizedBox(
    width: 240,
    height: 60,
    child: TextButton(
      key: Key("startQuiz"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => QuizPage(cards: deckStore.cards, deck: deck),
          ),
        );
      },

      style: TextButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),

      child: Text(
        "Iniciar Quiz",
        style: TextStyle(color: secondColor, fontSize: 18),
      ),
    ),
  );
}
